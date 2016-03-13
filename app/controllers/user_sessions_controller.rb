class UserSessionsController < ApplicationController
  
  before_action :require_login, only: [:destroy]

  def new
    @user = User.new
  end

  def create
    if @user == login(params[:email], params[:password], params[:remember])
     if @user.status == "active"
      flash[:notice] = "Login successful"
      redirect_back_or_to user_path(current_user)
     else
      redirect_to root_path
      flash[:alert] = 'Your accout has been deactivated/freezed. Contact Administrator'
     end

    else
      flash.now[:alert] = 'Login failed'
      render action: 'new'
      # redirect_to(request.referrer || root_path)
    end
  end

  def destroy
    logout
    flash[:success] = "Logged out"
    redirect_to root_path
  end
  
end
