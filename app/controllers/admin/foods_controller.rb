class Admin::FoodsController < ApplicationController
  def create
    @food = Food.new(food_params)
    @food.save
    redirect_to admin_path
  end

  def edit
    @food = Food.find(params[:id])
  end

  def update

  end

  def destroy

  end

  private
  def food_params
    params.permit(:food_name, :genre, :unit, :weight_per_unit)
  end
end
