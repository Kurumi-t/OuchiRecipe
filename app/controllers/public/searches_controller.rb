class Public::SearchesController < ApplicationController
  def search
    @word = params[:word]
    @post_recipes = PostRecipe.search(@word)
  end

  def ingredient_search
    @word = params[:ingredient_name]
    @post_recipes = PostRecipe.includes(:ingredients).where(ingredients: {food_name: @word})
  end
end