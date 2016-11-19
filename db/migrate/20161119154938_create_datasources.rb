class CreateDatasources < ActiveRecord::Migration[5.0]
  def change
    create_table :datasources do |t|
      t.integer :sourcetype
      t.string :address
      t.integer :port
      t.string :protocol
      t.string :username
      t.string :password

      t.timestamps
    end
  end
end
