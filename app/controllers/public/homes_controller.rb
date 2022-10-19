class Public::HomesController < ApplicationController
  def top
    @all_ranks = PostRecipe.create_all_ranks
  end
end
