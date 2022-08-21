class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @orders = @order.order_details
  end

  def update
  end
end
