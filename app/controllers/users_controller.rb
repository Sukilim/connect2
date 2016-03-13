class UsersController < ApplicationController
 skip_before_action :require_login
 before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  def new
    @user = User.new
    user_profile = @user.build_user_profile
  end

  def create
    @user = User.create(user_params.merge(role: "user", status: "active"))
    @user.build_user_profile(user_params['user_profile_attributes'])    
    if @user.save
      auto_login(@user)
      redirect_to user_path(current_user)
    else
      flash[:notice] = "Password must be 8 characters and more, email must be one of a kind"
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(current_user.id)
    else
      render :edit
    end
  end

  def index
  end

  def show
    # @user_profile = UserProfile.select(avatars).where(user_id: params[:id])
    @user_profile = UserProfile.where(user_id: params[:id]).first
    @request = Request.where(user_id: params[:id])
  end

  def destroy
    @user.destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, user_profile_attributes: [:user_id, :first_name, :last_name, :contact_no])
  end

  def set_user
    @user = current_user
  end
end
