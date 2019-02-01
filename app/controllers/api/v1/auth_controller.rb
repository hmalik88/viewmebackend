class Api::V1::AuthController < ApplicationController
 skip_before_action :authorized, only: [:create]

  def create
    @user = User.find_by(e_mail: user_login_params[:e_mail])
    if @user && @user.authenticate(user_login_params[:password])
      @token = encode_token({user_id: @user.id})
      render json: {user: UserSerializer.new(@user), jwt: @token}, status: :accepted
    else
      render json: {message: 'Invalid e-mail or password'}, status: :unauthorized
    end
  end

  def show
    if current_user
      render json: {user: current_user, contents: @user.contents, favorites: @user.favorites}
    else
      render json: {error: "not logged in"}, status: 422
    end
  end

  private

  def user_login_params
    params.require(:user).permit(:e_mail, :password)
  end
end
