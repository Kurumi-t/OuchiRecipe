class Public::SearchesController < ApplicationController
  def search
    @post_recipes = PostRecipe.search(params[:word])
  end
end
