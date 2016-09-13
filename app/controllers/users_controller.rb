class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(allowed_user_params)

    if @user.save!
      session[:user_id] = @user.id
      redirect_to root_path
    else
      redirect_to signup_path
    end
  end

  private

    def allowed_user_params
      params.require(:user).allow(:user_name, :email, :password, :password_confirmation)
    end
end
