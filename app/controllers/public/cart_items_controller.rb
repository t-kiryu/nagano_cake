class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.save
    redirect_to cart_items_path
  end

  def index
    @cart_items = CartItem
  end

  def update
  end

  def destroy
    # cart_item = CartItem.find(params[:id])
    # cart_item.destroy
    # redirect_to cart_items_path
  end

  def destroy_all
    cart_items.destroy_all
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
