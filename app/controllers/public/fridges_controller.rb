class Public::FridgesController < ApplicationController
  def index
    @user = current_user
    @fridges = Fridge.all
    @fridge = Fridge.new
  end

  def create
    @user = current_user
    @fridge = Fridge.new(fridge_params)
    @fridge.user_id = @user.id
    if @fridge.save
      redirect_to fridges_path(@user.id)
    else
      @fridges = Fridge.all
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
    params.require(:fridge).permit(:food_name, :genre, :amount, :unit)
  end
end
