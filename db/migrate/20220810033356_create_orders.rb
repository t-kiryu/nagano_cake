class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string  :postal_codenull, null: false
      t.string  :address,         null: false
      t.string  :name,            null: false
      t.integer :payment_method,  null: false
      t.integer :shipping_cost,   null: false
      t.integer :total_price,     null: false
      t.integer :status
      t.timestamps
    end
  end
end
