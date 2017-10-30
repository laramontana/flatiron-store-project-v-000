class CartsController < ApplicationController
  before_filter :authenticate_user!

  def show
    @current_cart = current_user.current_cart
  end

  def checkout

    redirect_to cart_path(params[])
  end



end
