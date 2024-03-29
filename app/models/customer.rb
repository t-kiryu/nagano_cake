class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :addresses,  dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :orders,     dependent: :destroy

  enum is_deleted: {退会:true, 有効:false}

  validates :email,            presence: true
  validates :last_name,        presence: true
  validates :first_name,       presence: true
  validates :last_name_kana,   presence: true
  validates :first_name_kana,  presence: true
  validates :postal_code,      presence: true, length: {is: 7}
  validates :address,          presence: true
  validates :telephone_number, presence: true, length: {is: 11}

end
