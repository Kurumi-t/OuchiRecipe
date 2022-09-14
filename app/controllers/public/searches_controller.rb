class Public::SearchesController < ApplicationController
  def search
    @range = params[:range]
    if @range == "PostRecipe"
      @post_recipes = PostRecipe.looks(params[:search], params[:word])
    else
      @ingredients = Ingredient.looks(params[:search], params[:word])
    end
  end
end
