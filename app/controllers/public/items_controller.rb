class Public::ItemsController < ApplicationController
  before_action :authenticate_customer!, except: [:top, :about, :index, :show]

  def top
    @random = Item.order("RANDOM()").limit(4)
  end

  def about
  end

  def index
    @random = Item.order("RANDOM()").limit(8)
    @items = Item.page(params[:page])
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

end
