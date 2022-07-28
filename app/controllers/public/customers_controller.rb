class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to puclic_customers_my_page_path(customers.id)
  end

  def unsubscribe
  end

  def withdraw
  end

  private


end
