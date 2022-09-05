class Admin::HomesController < ApplicationController
  def top
    @foods = Food.all
  end
end
