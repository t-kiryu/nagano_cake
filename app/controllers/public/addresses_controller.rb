class Public::AddressesController < ApplicationController
  before_action :authenticate_customer!

  def index
    @address = Address.new
    @addresses = Address.all
    # ログインユーザーの情報のみ表示
    @addresses = current_customer.addresses
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      #flash[:notice] = "You have create address successfully."
      redirect_to addresses_path, notice: "You have create address successfully."
    else
      # ↓ render用
      @addresses = Address.all
      render :index
    end
  end

  def edit
    @address = Address.find(params[:id])
    @address.customer_id = current_customer.id
  end

  def update
    @address = Address.find(params[:id])
    @address.customer_id = current_customer.id
    if @address.update(address_params)
      flash[:notice] = "You have updated address successfully."
      redirect_to addresses_path
    else
      render :edit
    end
  end

  def destroy
    address = Address.find(params[:id])
    address.customer_id = current_customer.id
    address.destroy
    redirect_to addresses_path
  end

  private

  def address_params
    params.require(:address).permit(:postal_code, :address, :name)
  end

end
