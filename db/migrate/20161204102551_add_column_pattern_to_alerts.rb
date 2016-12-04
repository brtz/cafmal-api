class AddColumnPatternToAlerts < ActiveRecord::Migration[5.0]
  def change
    add_column :alerts, :pattern, :string, default: '*'
  end
end
