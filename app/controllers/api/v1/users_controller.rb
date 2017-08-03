class Api::V1::UsersController < Api::ApplicationController
  respond_to :json

  def update
    @user = current_user

    unless params[:confirm_password] == user_params[:password]
      params.delete(:password)
    end

    if @user.update(user_params)
      render json: { user: @user }, status: 200
    else
      render json: { errors: @user.errors.full_messages }, status: 400
    end
  end

  private

    def user_params
      params.permit(:avatar, :username, :email, :password)
    end

end
