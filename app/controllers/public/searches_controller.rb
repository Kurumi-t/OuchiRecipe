class Public::SearchesController < ApplicationController
  def search
    @word = params[:word]
    @post_recipes = PostRecipe.search(@word).page(params[:page]).per(10)
    if @post_recipes == []
      @post_recipes = PostRecipe.includes(:ingredients).where(ingredients: {food_name: @word}).where(is_draft: false).page(params[:page]).per(10)
    end
  end

  def ingredient_search
    @word = params[:ingredient_name]
    @post_recipes = PostRecipe.includes(:ingredients).where(ingredients: {food_name: @word}).where(is_draft: false).page(params[:page]).per(10)
  end
end