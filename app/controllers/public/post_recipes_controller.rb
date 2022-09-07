class Public::PostRecipesController < ApplicationController
  def index
    @post_recipes = PostRecipe.all
  end

  def new
    @post_recipe = PostRecipe.new
    @foods = Food.all
    #if @food.genre == "vegetable"
    #  @foods = Food.find_by(genre: 'vegetable')
    #end
  end

  def create
    @post_recipe = PostRecipe.new(post_recipe_params)
    @post_recipe.save
    redirect_to post_recipe_path(@post_recipe.id)
  end

  def show
  end

  def edit
  end

  def update
    @post_recipe = PostRecipe.find(params[:id])
    @post_recipe.update
    redirect_to post_recipe_path(@post_recipe.id)

  end

  def destroy

  end

  private
  def post_recipe_params
    params.require(:post_recipe).permit(:recipe_image, :title, :advice, :is_draft)
  end

  def ingredient_params
    params.require(:ingredient).permit(:serving, :amount, :other_amount)
  end

  def making_recipe_params
    params.require(:making_recipe).permit(:recipe)
  end
end
