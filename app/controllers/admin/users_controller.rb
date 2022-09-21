class Admin::UsersController < ApplicationController
  def show
    @user = User.page(params[:page])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
