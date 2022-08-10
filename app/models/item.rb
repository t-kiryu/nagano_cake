class Item < ApplicationRecord
  has_one_attached :image

  belongs_to :genre

  has_many :cart_item, dependent: :destroy

  def with_tax_price
    (price * 1.1).floor
  end

  enum is_active: {販売中:true, 販売停止中:false}

end
