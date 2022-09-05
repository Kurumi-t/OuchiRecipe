class Public::UsersController < ApplicationController
  def show
    @user = current_user
   # @post_recipes = PostRecipe.page(params[:page]).per(8)
    #@post_recipe_count = @user.post_recipe.all.count
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to users_my_page_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end
end