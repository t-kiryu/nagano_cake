class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :addresses,  dependent: :destroy
  has_many :cart_items, dependent: :destroy
  # has_many :orders, dependent: :destroy

  enum is_deleted: {退会:true, 有効:false}

  # is_deletedがfalse(有効)ならtrue(退会済み)を返すようにしている
  # ログイン時に退会済みのユーザーが同じアカウントでログイン出来ないよう制約
  # def active_for_authentication?
  #   super && (is_deleted == false)
  # end

end
