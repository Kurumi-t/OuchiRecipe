class Public::FavoritesController < ApplicationController
  def create
    post_recipe = PostRecipe.find(params[:post_recipe_id])
    favorite = current_user.favorites.new(post_recipe_id: post_recipe.id)
    favorite.save
    redirect_to post_recipe_path(post_recipe)
  end

  def destroy
    post_recipe = PostRecipe.find(params[:post_recipe_id])
    favorite = current_user.favorites.find_by(post_recipe_id: post_recipe.id)
    favorite.destroy
    redirect_to post_recipe_path(post_recipe)
  end
end
