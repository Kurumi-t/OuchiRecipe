class Admin::PostRecipesController < ApplicationController
  before_action :authenticate_admin!
  def index
    @post_recipes = PostRecipe.where("is_draft = ?", false).page(params[:page]).per(20)
  end

  def destroy
    post_recipe = PostRecipe.find(params[:id])
    if post_recipe.destroy
      redirect_to admin_user_path(post_recipe.user.id)
    else
      render templete: 'users/show'
    end
  end
end
