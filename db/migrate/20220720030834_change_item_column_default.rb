class ChangeItemColumnDefault < ActiveRecord::Migration[6.1]
  def change
    change_column_default :items, :is_active, nil
  end
end
