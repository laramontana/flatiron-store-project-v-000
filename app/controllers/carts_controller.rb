class CartsController < ApplicationController
  # before_filter :authenticate_user!

  def show
    @cart = Cart.find(params[:id])
  end

  def checkout
    @cart = Cart.find(params[:id])
    @cart.checkout
    current_user.remove_current_cart
    redirect_to cart_path(@cart)
  end



end
