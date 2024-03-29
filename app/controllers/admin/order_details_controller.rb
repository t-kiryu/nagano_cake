class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(params_making_status)
    redirect_to admin_order_path(@order_detail.order)
  end

  private

  def params_making_status
    params.require(:order_detail).permit(:making_status)
  end

end
