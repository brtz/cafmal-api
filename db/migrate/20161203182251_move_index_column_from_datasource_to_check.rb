class MoveIndexColumnFromDatasourceToCheck < ActiveRecord::Migration[5.0]
  def change
    remove_column :datasources, :index, :string
    add_column :checks, :index, :string
  end
end
