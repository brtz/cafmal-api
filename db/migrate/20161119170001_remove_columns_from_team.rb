class RemoveColumnsFromTeam < ActiveRecord::Migration[5.0]
  def change
    remove_column :teams, :alert_method, :string
    remove_column :teams, :alert_address, :string
  end
end
