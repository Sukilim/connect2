class Api::V1::AgentProfileController < API::BaseController


  def create
  	@agent_profile = AgentProfile.new(agent_profile_params.merge(user_id: current_api_user.id))
    @agent_profile.first_name = "First Name"
    @agent_profile.last_name = "Last Name"
    letters = (0..9).to_a + ('a'..'z').to_a + ('A'..'Z').to_a
    @agent_profile[:pin_code] = letters.sample(5).join.to_s

  	if @agent_profile.save

      render(
        json: { message: "Agent Profile created", agent_profile: @agent_profile },
        status: 200
        )
      
      
    else 
      render(
        json: { message: "#{@agent_profile.errors.full_messages}" },
        status: 422
        )
    end
  end 

  def send_pin_code
    @user = current_api_user
    @agent_profile = AgentProfile.find_by(user_id: @user.id)
    @agent_profile.contact_no = params[:contact_no]
    @agent_profile.save

    response = HTTParty.get("http://login.bulksms.my/websmsapi/ISendSMS.aspx?username=#{ENV['SMS_USERNAME']}&password=#{ENV['SMS_PASSWORD']}&message=#{@agent_profile.pin_code}&mobile=6#{@agent_profile.contact_no}&type=1")

    if response
      render(
      json: {message: "Pin Code Sent"},
      status: 200
      )
    else
      render(
      json: {message: "Cannot send pin code"},
      status: 422
     )
    end
  end


  def verify_pin_code

    @user = current_api_user
    @agent_profile = AgentProfile.find_by(user_id: @user.id)
    pin_code = params[:pin_code]

    if @agent_profile.pin_code == pin_code
      @agent_profile.credits = 3
      render(
      json: {message: "Pin Code Verified"},
      status: 200
      )
    else
      render(
      json: {message: "Cannot verify pin code"},
      status: 422
      )

    end
  end

  def upload_photo
    @user = current_api_user
    @agent_profile = AgentProfile.find_by(user_id: @user.id)

    @agent_profile.first_name = params[:first_name]
    @agent_profile.last_name = params[:last_name]

    if @agent_profile.save
      render(
      json: {message: "Profile Updated"},
      status: 200
      )
    else
      render(
      json: {message: "Profile Update Failed"},
      status: 422
      )
    end 
  end

  def update_profile
    @user = current_api_user
    @agent_profile = AgentProfile.find_by(user_id: @user.id)

    if @agent_profile.update(agent_profile_params)
      render(
      json: {message: "Profile Updated"},
      status: 200
      )
    else
      render(
      json: {message: "Profile Update Failed"},
      status: 422
      )
    end 
  end

  private

  def agent_profile_params
  	params.require(:agent_profile).permit(:first_name, :last_name, :contact_no, :ren_id, :company_name, :company_reg_no, :about_me, :pin_code, :credits)
  end 

end
