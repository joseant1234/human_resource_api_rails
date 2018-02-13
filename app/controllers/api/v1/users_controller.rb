class Api::V1::UsersController < Api::V1::ApiController

  def create
    @user = User.new(user_params)
    if @user.save
      @jwt = JsonWebToken.encode({user_id: @user.id})
      render :show, status: :created
    else
      error_array!(@user.erros.full_messages,:unprocessable_entity)
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
