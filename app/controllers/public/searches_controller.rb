class Public::SearchesController < ApplicationController
  def search
    @post_recipes = PostRecipe.search(params[:word])
  end

  def ingredient_search
    @post_recipes = PostRecipe.includes(:ingredients).where(ingredients: {food_name: params[:ingredient_name]})
  end
end