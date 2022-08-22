class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  # 支払い・配送情報入力
  def new
    @order = Order.new
    @order.customer_id = current_customer.id
  end

  # 注文情報の仮保存・最終確認
  def confirm
    @cart_items = current_customer.cart_items
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.payment_method = params[:order][:payment_method]
    @shipping_cost = 800
    @total_price = 0
    # 配送先がログインユーザー登録情報先key(0) => ログインユーザーの住所情報を呼出し、@orderに格納
    if params[:order][:shipping_address] == '0'
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + " " + current_customer.first_name
    # 配送先が登録配送先の場合key(1) => アドレスモデルからログインユーザーの登録住所を呼出し、@orderに格納
    elsif params[:order][:shipping_address] == '1'
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    # 配送先が新規登録先の場合key(2) => アドレスモデルに住所情報を新規登録し、@addressに格納
    elsif params[:order][:shipping_address] == '2'
      @address = current_customer.addresses.new
      @address.postal_code = params[:order][:postal_code]
      @address.address = params[:order][:address]
      @address.name = params[:order][:name]
      @address.customer_id = current_customer.id
    #保存処理が正常
    if @address.save
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    #保存処理に不備
    else
      redirect_to new_order_path
    end
    end
  end

  # 注文情報の確定・保存
  def create
    # confirm情報(商品注文情報のみ)を保存
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    if @order.save!
      # 商品注文情報のみの保存になっているので、下記each文で各商品ごとの情報をorder_detailsへ保存
      # カート内に商品は複数あるので、商品ごとにid, price, amountのデータを格納し、完了したらsave処理
      current_customer.cart_items.each do |cart_item|
        order_detail = OrderDetail.new(order_id: @order.id)
        order_detail.item_id = cart_item.item_id
        order_detail.price = cart_item.item.price
        order_detail.amount = cart_item.amount
        order_detail.save!
      end
      # 必要なデータの保存完了後、カート内商品を全削除
      current_customer.cart_items.destroy_all
      redirect_to orders_complete_path
    else
      render "new"
    end
  end

  # thanks画面の表示
  def complete
  end

  def index
    @orders = Order.all
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details.all
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :shipping_cost, :total_price)
  end

  def address_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name)
  end
end
