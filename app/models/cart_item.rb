class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :customer

  has_many   :order, dependent: :destroy

  def subtotal
    item.with_tax_price * amount
  end
end
