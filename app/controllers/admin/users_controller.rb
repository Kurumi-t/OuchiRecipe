class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  def show
    @user = User.find(params[:id])
    @post_recipes = @user.post_recipes.where("user_id = ? and is_draft = ?", @user.id, false).page(params[:page]).per(16)
    @post_recipe_count = @post_recipes.all.count
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      redirect_to admin_user_path(params[:id])
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :is_deleted)
  end
end
