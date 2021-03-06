class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    return @current_user ||= nil unless session[:user_id]
    @current_user ||= User.find_by(id: session[:user_id])
  end
  helper_method :current_user

	private

	def not_authenticated
	  redirect_to login_path, alert: "Please login first"
	end

	def authorize_user
  	redirect_to main_app.root_path unless current_user.role == "admin"
  end
  
end