class Admin::FoodsController < ApplicationController
  def index
    @food = Food.new
    @foods = Food.all
  end

  def create
    @food = Food.new(food_params)
    @food.save
    redirect_to admin_foods_path
  end

  def edit
    @food = Food.find(params[:id])
  end

  def update
    @food = Food.find(params[:id])
    @food.update(food_params)
    redirect_to edit_admin_food_path(@food.id)
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    redirect_to admin_foods_path
  end

  private
  def food_params
    params.require(:food).permit(:food_name, :genre, :unit, :weight_per_unit)
  end
end
