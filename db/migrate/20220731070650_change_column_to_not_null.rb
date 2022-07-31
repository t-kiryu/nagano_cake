class ChangeColumnToNotNull < ActiveRecord::Migration[6.1]
  def change
    change_column :addresses, :customer_id, :integer, null: true
  end
end
