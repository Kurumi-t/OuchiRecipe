class Public::PostRecipesController < ApplicationController
  def index
    @post_recipes = PostRecipe.all
  end

  def new
    @post_recipe = PostRecipe.new
    @post_recipe.ingredients.new
    @post_recipe.making_recipes.new
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
    @ingredients = @post_recipe.ingredients
    @making_recipes = @post_recipe.making_recipes
  end

  def edit
    @post_recipe = PostRecipe.find(params[:id])
  end

  def update
    @post_recipe = PostRecipe.find(params[:id])
    if @post_recipe.update(post_recipe_params)
      redirect_to post_recipe_path(@post_recipe.id)
    else
      render :edit
    end
  end

  def destroy
    @post_recipe = PostRecipe.find(params[:id])
    if @post_recipe.destroy
      redirect_to users_my_page_path(current_user.id)
    else
      render :show
    end
  end

  def search
    @post_recipes = PostRecipe.search(params[:word])
  end

  private
  def post_recipe_params
    params.require(:post_recipe).permit(:recipe_image, :serving, :title, :advice, :is_draft,
      ingredients_attributes: [:id, :post_recipe_id, :food_name, :unit, :amount, :other_amount, :_destroy],
      making_recipes_attributes: [:id, :post_recipe_id, :recipe, :_destroy]
    )
  end
end
