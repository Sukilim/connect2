class Api::V1::UsersController < API::BaseController

 #skip_before_action :require_login

  def index
    @users = User.all 
    render json: @users
  end

  def create

    @user = User.new(user_params.merge(role: "agent"))
      if User.find_by(email: @user.email).blank?
        password = params[:password]
        salt = BCrypt::Engine.generate_salt
        @user.crypted_password = BCrypt::Engine.hash_secret(password, salt)
        @user.salt = salt
        @user.save
        token = @user.generate_auth_token
        render(
        json: { message: "User created", auth_token: token, user_id: @user.id},
        status: 200
        )    
        puts current_api_user
      else
        render(
        json: { message: "#{@user.errors.full_messages}" },
        status: 422
        )
      end   

  end

  def dashboard
  end

  def show
    render json: @user
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    
    render json: @user
  end 

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :crypted_password, :salt)
  end

  def generate_random_uid
    begin
      @auth[:uid] = ( (SecureRandom.random_number)*1234567890 + 1234567890 ).to_i 
    end while Authentication.exists?(uid: @auth[:uid])
  end

end