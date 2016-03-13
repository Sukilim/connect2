class Api::V1::UserSessionsController < API::BaseController
  
  def create

    @user = User.find_by_credentials(params[:email], params[:password])

    if @user
      token = @user.generate_auth_token
      render(
        json: { message: "User logged in", auth_token: token, user: @user.id},
        status: 200
      )
    else
      render(
        json: { message: "Unauthorized" },
        status: 422
      )
    end
  end
  
end
