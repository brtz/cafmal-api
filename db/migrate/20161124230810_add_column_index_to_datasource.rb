class AddColumnIndexToDatasource < ActiveRecord::Migration[5.0]
  def change
    add_column :datasources, :index, :string
  end
end
