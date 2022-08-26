class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def update
    @order = Order.find(params[:id])
    @order.update(params_status)
    # ↓ render用
    @order_details = @order.order_details
    render :show
  end

  private

  def params_status
    params.require(:order).permit(:status)
  end
end
