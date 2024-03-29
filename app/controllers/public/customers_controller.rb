class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      flash[:notice] = "You have updated customer successfully."
      redirect_to customers_my_page_path(@customer.id)
    else
      render :edit
    end
  end

  def unsubscribe
    @customer = current_customer
  end


  def withdrawal
    @customer = Customer.find(current_customer.id)
    @customer.update(is_deleted: true)
    # ブラウザ(Cookie)等に保存されたセッション情報を全て削除
    reset_session
    flash[:notice] = "退会処理を実行しました"
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana,
                                                 :postal_code, :address, :telephone_number, :email, :is_deleted)
  end

end
