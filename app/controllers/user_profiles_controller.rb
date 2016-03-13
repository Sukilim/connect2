class UserProfilesController < ApplicationController
  require 'httparty'
  before_action :set_user_profile, only: [:edit, :update, :destroy]
  # before_action :photo_upload, only: [:new, :create, :update]
  
  def new
  	@user_profile = UserProfile.new
  end

  def create
    
    user_profile = current_user.create_profile(user_profile_params)
    if user_profile.persisted?
      letters = (0..9).to_a + ('a'..'z').to_a + ('A'..'Z').to_a
      user_profile.update(:pin_code => letters.sample(5).join.to_s)
      # redirect_to user_profile_verification_path(:profile_id => user_profile.id)
    else
      render :new
    end  
  end

  def edit
  end

  def update
    if @user_profile.update(user_profile_params)
      redirect_to user_path(current_user.id)
    else
      render :edit
    end
  end

  def verification
    user_profile = UserProfile.find_by(user_id: params[:id])
    response = HTTParty.get("http://login.bulksms.my/websmsapi/ISendSMS.aspx?username=#{ENV['SMS_USERNAME']}&password=#{ENV['SMS_PASSWORD']}&message=#{user_profile.pin_code}&mobile=6#{user_profile.contact_no}&type=1")
    flash[:success] = "Pin Code Sent To Your Mobile"
  end
  
  def check_pin_code
    user = UserProfile.find_by(pin_code: params[:user_profile][:pin_code])
      if user.present?
        letters = (0..9).to_a + ('a'..'z').to_a + ('A'..'Z').to_a
        token = letters.sample(12).join
        redirect_to user_path(current_user.id)
      else
       render :verification
      end
  end 

  private

  def user_profile_params
  	params.require(:user_profile).permit(:first_name, :last_name, :contact_no, :avatar)
  end 

  def set_user_profile
    @user_profile = current_user.profile
  end

  def photo_upload
    uploader = AvatarUploader.new
    uploader.store!(my_file)
    uploader.retrieve_from_store!('my_file.png')
  end
end
