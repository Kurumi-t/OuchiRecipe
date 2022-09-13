class Public::PostRecipesController < ApplicationController
  def index
    @post_recipes = PostRecipe.all
  end

  def new
    @post_recipe = PostRecipe.new
    @foods = Food.all
  end

  def create
    @post_recipe = PostRecipe.new(post_recipe_params)
    @post_recipe.user_id = current_user.id
    if @post_recipe.save
      redirect_to post_recipe_path(@post_recipe.id)
    else
      render :new
    end
  end

  def show
    @post_recipe = PostRecipe.find(params[:id])
  end

  def edit
    @post_recipe = PostRecipe.find(params[:id])
  end

  def update
    @post_recipe = PostRecipe.find(params[:id])
    if @post_recipe.update
      redirect_to post_recipe_path(@post_recipe.id)
    else
      render :edit
    end
  end

  def destroy

  end

  private
  def post_recipe_params
    params.require(:post_recipe).permit(:recipe_image, :title, :advice, :is_draft,
      ingredients_attributes: [:serving, :amount, :other_amount],
      making_recipes_attributes: [:recipe]
    )
  end
end
