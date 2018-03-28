class Api::V1::SessionsController < Api::V1::ApiController

  def create
    @user = User.find_by(email: params[:email].to_s.downcase)
    if @user && @user.authenticate(params[:password])
      @jwt = JsonWebToken.encode({user_id: @user.id})
      render template: "api/v1/users/show", status: :ok
    else
      #render json: { errors: ['Invalid username / password'] }, status: :unauthorized
      error!('Invalid username / password', :unauthorized)
    end
  end

end
