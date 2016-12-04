class AddColumnNameToDatasources < ActiveRecord::Migration[5.0]
  def change
    add_column :datasources, :name, :string
  end
end
