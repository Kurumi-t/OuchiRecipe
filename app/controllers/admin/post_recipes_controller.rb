class Admin::PostRecipesController < ApplicationController
  def index
    @post_recipes = PostRecipe.all
  end

  def show
    @post_recipe = PostRecipe.find(params[:id])
    @ingredients = @post_recipe.ingredients
    @making_recipes = @post_recipe.making_recipes
  end

  def destroy
    post_recipe = PostRecipe.find(params[:id])
    if post_recipe.destroy
      redirect_to admin_user_path(post_recipe.user.id)
    else
      render :show
    end
  end
end
