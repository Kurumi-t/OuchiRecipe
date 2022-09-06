class Public::PostRecipesController < ApplicationController
  def index
    @post_recipes = PostRecipe.all
  end

  def new
    @post_recipe = PostRecipe.new
  end

  def show
  end

  def edit
  end
end
