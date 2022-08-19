class RenamePostalCodenullColumnToOrders < ActiveRecord::Migration[6.1]
  def change
    rename_column :orders, :postal_codenull, :postal_code
  end
end
