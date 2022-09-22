class Admin::HomesController < ApplicationController
  def top
    @user = User.page(params[:page])
  end
end
