class RenameColumnIsActiveToIsEnabledFromAlerts < ActiveRecord::Migration[5.0]
  def change
    rename_column :alerts, :is_active, :is_enabled
    add_column :alerts, :is_silenced, :boolean
  end
end
