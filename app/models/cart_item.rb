class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :customer
  
  # has_many :order, dependent: :destroy
end
