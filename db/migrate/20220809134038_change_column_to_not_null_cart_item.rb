class ChangeColumnToNotNullCartItem < ActiveRecord::Migration[6.1]
  def change
    change_column :cart_items, :customer_id, :integer, null: true
  end
end
