class Public::UsersController < ApplicationController
  def show
    @user = current_user
    @post_recipes = @user.post_recipes.page(params[:page]).per(8)
    @post_recipe_count = @user.post_recipes.all.count
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to users_my_page_path
  end

  def withdraw
    @user = current_user
  end

  def withdraw_update
    @user = current_user
    @user.usspdate(is_deleted: true)
    reset_session
    flash[:notice] = "退会しました"
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :profile_image)
  end
end
