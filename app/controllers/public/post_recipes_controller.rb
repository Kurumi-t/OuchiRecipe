class Public::PostRecipesController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  def index
    @user = current_user
    favorites = Favorite.where(user_id: @user.id).pluck(:post_recipe_id)
    post_recipes = PostRecipe.find(favorites)
    @post_recipes = Kaminari.paginate_array(post_recipes).page(params[:page]).per(12)
  end

  def new
    @post_recipe = PostRecipe.new
    @post_recipe.ingredients.new
    @post_recipe.making_recipes.new
  end

  def create
    @post_recipe = PostRecipe.new(post_recipe_params)
    @post_recipe.user_id = current_user.id
    if params[:post]
      @post_recipe.is_draft = false
      if @post_recipe.save
        redirect_to post_recipe_path(@post_recipe.id), notice: "レシピを投稿しました！"
      else
        render :new, alert: "登録できませんでした。お手数ですが、入力内容をご確認のうえ再度お試しください"
      end
    else
      if @post_recipe.update(is_draft: true)
        redirect_to confirm_path, notice: "レシピを下書き保存しました！"
      else
        render :new, alert: "登録できませんでした。お手数ですが、入力内容をご確認のうえ再度お試しください"
      end
    end
  end

  def show
    @post_recipe = PostRecipe.find(params[:id])
    @ingredients = @post_recipe.ingredients
    @making_recipes = @post_recipe.making_recipes
    @shopping_list = ShoppingList.new
  end

  def edit
    @post_recipe = PostRecipe.find(params[:id])
  end

  def update
    @post_recipe = PostRecipe.find(params[:id])
    if params[:publicize_draft]
        @post_recipe.is_draft = false
      if @post_recipe.update(post_recipe_params)
        redirect_to post_recipe_path(@post_recipe.id), notice: "下書きのレシピを公開しました！"
      else
        @post_recipe.is_draft = true
        render :edit, alert: "レシピを公開できませんでした。お手数ですが、入力内容をご確認のうえ再度お試しください"
      end
    elsif params[:update_post]
      @post_recipe.attributes = post_recipe_params
      if @post_recipe.save(context: :publicize)
        redirect_to post_recipe_path(@post_recipe.id), notice: "レシピを更新しました！"
      else
        render :edit, alert: "レシピを更新できませんでした。お手数ですが、入力内容をご確認のうえ再度お試しください"
      end
    else
      if @post_recipe.update(post_recipe_params)
        redirect_to confirm_path, notice: "下書きレシピを更新しました！"
      else
        render :edit, alert: "更新できませんでした。お手数ですが、入力内容をご確認のうえ再度お試しください"
      end
    end
  end

  def destroy
    @post_recipe = PostRecipe.find(params[:id])
    if @post_recipe.destroy
      redirect_to my_page_path(current_user.id)
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
