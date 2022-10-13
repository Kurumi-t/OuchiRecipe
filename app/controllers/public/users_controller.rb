class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = current_user
    @post_recipes = PostRecipe.where("user_id = ? and is_draft = ?", @user.id, false).page(params[:page]).per(16)
    @post_recipe_count = @post_recipes.all.count
  end

  def confirm
    @user = current_user
    @post_recipes = PostRecipe.where("user_id = ? and is_draft = ?", @user.id, true).page(params[:page]).per(16)
    @post_recipe_count = @post_recipes.all.count
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to my_page_path
  end

  def withdraw
    @user = current_user
  end

  def withdraw_update
    @user = current_user
    if @user.update(is_deleted: true)
      reset_session
      flash[:notice] = "退会しました"
      redirect_to root_path
    else
      renter :withdraw
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :profile_image)
  end
end
