class AddDeletedAtToAll < ActiveRecord::Migration[5.0]
  def change
    add_column :alerts, :deleted_at, :datetime
    add_column :alerters, :deleted_at, :datetime
    add_column :checks, :deleted_at, :datetime
    add_column :datasources, :deleted_at, :datetime
    add_column :events, :deleted_at, :datetime
    add_column :users, :deleted_at, :datetime
    add_column :workers, :deleted_at, :datetime
  end
end
