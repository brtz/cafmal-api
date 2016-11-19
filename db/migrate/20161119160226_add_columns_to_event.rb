class AddColumnsToEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :message, :string
    add_column :events, :kind, :integer
    add_column :events, :severity, :integer
  end
end
