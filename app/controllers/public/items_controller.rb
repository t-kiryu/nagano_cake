class Public::ItemsController < ApplicationController
  def top
    @items = Item.page(params[:page])
  end

  def about
  end

  def index
    @items = Item.page(params[:page])
  end

  def show

  end
end
