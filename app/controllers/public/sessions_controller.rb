# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :customer_state, only: [:create]
  # before_action :reject_customer, only: [:create]

  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create
    super
  end

  # DELETE /resource/sign_out
  def destroy
    super
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end


  # 退会済みか判断し、退会済みアカウントは新規登録に遷移
  def customer_state
    # 処理1
    # sign_in時のemailをもとにアカウントを1件取得。customerモデル内のemailを検索し、一致したら@customerに格納
    @customer = Customer.find_by(email: params[:customer][:email])

  # アカウント取得できない => 処理終了(退会済みか確認しない)
  # アカウント取得できた   => 処理2へ進む
  return if !@customer

  # 処理2
  # 取得したアカウントpassと入力されたpassが一致するか判別
  # (1)処理1の該当者が格納されている@customerのpassと入力passが一致するか確認
  # (2)退会ステータスが"退会"になっているか確認
  if @customer.valid_password?(params[:customer][:password]) && @customer.is_deleted == "退会"

  # 処理3
  # email一致(処理1), pass一致 & 退会済み(処理2) の人は新規登録へ遷移、その他はログイン
    redirect_to new_customer_registration_path
  end
  end
end