class CartsController < ApplicationController
  # before_filter :authenticate_user!

  def show
    @cart = Cart.find(params[:id])
  end

  def checkout

  end



end
