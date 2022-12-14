class Public::ShoppingListsController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = current_user
    @shopping_lists = ShoppingList.all
    @shopping_list = ShoppingList.new
    @fridge = Fridge.new
  end

  def to_fridge
    @user = current_user
    @shopping_lists = ShoppingList.all
    @shopping_list = ShoppingList.new
    @fridge = Fridge.new
  end

  def create
    @user = current_user
    @shopping_list = ShoppingList.new(shopping_list_params)
    @shopping_list.user_id = @user.id
    if @shopping_list.save
      redirect_to shopping_lists_path(@user.id)
    else
      @shopping_lists = ShoppingList.all
      render :index
    end
  end

  def update
    shopping_list = ShoppingList.find(params[:id])
    if shopping_list.update(shopping_list_params)
      redirect_to shopping_lists_path(current_user.id)
    else
      @shopping_lists = ShoppingList.all
      render :index
    end
  end

  def destroy
    shopping_list = ShoppingList.find(params[:id])
    if shopping_list.destroy
      redirect_to shopping_lists_path(current_user.id)
    else
      @shopping_lists = ShoppingList.all
      render :index
    end
  end

  def destroy_all
    current_user.shopping_lists.destroy_all
    redirect_to shopping_lists_path(current_user.id)
  end

  private
  def shopping_list_params
    params.require(:shopping_list).permit(:food_name, :amount, :unit)
  end
end
