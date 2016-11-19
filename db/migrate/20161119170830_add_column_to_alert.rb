class AddColumnToAlert < ActiveRecord::Migration[5.0]
  def change
    add_column :alerts, :is_active, :boolean
  end
end
