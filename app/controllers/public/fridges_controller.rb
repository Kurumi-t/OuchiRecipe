class Public::FridgesController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = current_user
    @fridges = Fridge.all
    @fridge = Fridge.new
    @vegetable_fridges = Fridge.where(user_id: @user.id, genre: 0)
    @meat_fridges = Fridge.where(user_id: @user.id, genre: 1)
    @seafood_fridges = Fridge.where(user_id: @user.id, genre: 2)
    @staple_food_and_flour_fridges = Fridge.where(user_id: @user.id, genre: 3)
    @eggs_and_milk_and_beans_fridges = Fridge.where(user_id: @user.id, genre: 4)
    @fruit_and_dessert_fridges = Fridge.where(user_id: @user.id, genre: 5)
    @seasoning_fridges = Fridge.where(user_id: @user.id, genre: 6)
    @others_fridges = Fridge.where(user_id: @user.id, genre: 7)
  end

  def create
    @user = current_user
    @fridge = Fridge.new(fridge_params)
    @fridge.user_id = @user.id
    if @fridge.save
      redirect_to fridges_path(@user.id)
    else
      @fridges = Fridge.all
      @vegetable_fridges = Fridge.where(user_id: @user.id, genre: 0)
      @meat_fridges = Fridge.where(user_id: @user.id, genre: 1)
      @seafood_fridges = Fridge.where(user_id: @user.id, genre: 2)
      @staple_food_and_flour_fridges = Fridge.where(user_id: @user.id, genre: 3)
      @eggs_and_milk_and_beans_fridges = Fridge.where(user_id: @user.id, genre: 4)
      @fruit_and_dessert_fridges = Fridge.where(user_id: @user.id, genre: 5)
      @seasoning_fridges = Fridge.where(user_id: @user.id, genre: 6)
      @others_fridges = Fridge.where(user_id: @user.id, genre: 7)
      render :index
    end
  end

  def fridge_create
    @user = current_user
    @fridge = Fridge.new(fridge_params)
    @fridge.user_id = @user.id
    if @fridge.save
      @shopping_list = ShoppingList.find_by(id: params[:fridge][:shopping_list_id])
      @shopping_list.destroy
      redirect_to fridges_path(@user.id)
    else
      @fridges = Fridge.all
      @vegetable_fridges = Fridge.where(user_id: @user.id, genre: 0)
      @meat_fridges = Fridge.where(user_id: @user.id, genre: 1)
      @seafood_fridges = Fridge.where(user_id: @user.id, genre: 2)
      @staple_food_and_flour_fridges = Fridge.where(user_id: @user.id, genre: 3)
      @eggs_and_milk_and_beans_fridges = Fridge.where(user_id: @user.id, genre: 4)
      @fruit_and_dessert_fridges = Fridge.where(user_id: @user.id, genre: 5)
      @seasoning_fridges = Fridge.where(user_id: @user.id, genre: 6)
      @others_fridges = Fridge.where(user_id: @user.id, genre: 7)
      render :index
    end
  end

  def update
    fridge = Fridge.find(params[:id])
    if fridge.update(fridge_params)
      redirect_to fridges_path(current_user.id)
    else
      @fridges = Fridge.all
      render :index
    end
  end

  def destroy
    fridge = Fridge.find(params[:id])
    if fridge.destroy
      redirect_to fridges_path(current_user.id)
    else
      @fridges = Fridge.all
      render :index
    end
  end

  private
  def fridge_params
    params.require(:fridge).permit(:food_name, :genre, :amount, :unit, :shopping_list_id)
  end
end