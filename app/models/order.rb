class Order < ApplicationRecord
  has_one_attached :image

  belongs_to :customer

  has_many :order_details, dependent: :destroy

  enum payment_method:   {credit_card: 0, transfer: 1}
  enum shipping_address: {ご自身の住所:0, 登録済住所から選択:1, 新しいお届け先:2}
  enum status:           {入金待ち:0, 入金確認:1, 製作中:2, 発送準備中:3, 発送済み:4}

end