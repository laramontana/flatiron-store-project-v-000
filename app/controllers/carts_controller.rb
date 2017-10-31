class CartsController < ApplicationController

  def show
    @cart = Cart.find(params[:id])
    @cart.status = "test"

  end

  def checkout
    @cart = Cart.find(params[:id])
    @cart.checkout
    current_user.remove_current_cart
    redirect_to cart_path(@cart), {notice: 'Your cart was checked out successfully!'}
  end
end
