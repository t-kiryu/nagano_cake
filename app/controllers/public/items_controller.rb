class Public::ItemsController < ApplicationController
  before_action :authenticate_customer!, except: [:top, :about, :index, :show]

  def top
    @items = Item.page(params[:page])
  end

  def about
  end

  def index
    @items = Item.page(params[:page])
  end

  def show
    @item = Item.find(params[:id])
  end

end
