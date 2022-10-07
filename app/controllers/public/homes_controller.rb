class Public::HomesController < ApplicationController
  def top
    @all_ranks = PostRecipe.find(Favorite.group(:post_recipe_id).order('count(post_recipe_id) desc').limit(4).pluck(:post_recipe_id))
  end

  def about
  end
end
