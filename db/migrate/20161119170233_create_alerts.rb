class CreateAlerts < ActiveRecord::Migration[5.0]
  def change
    create_table :alerts do |t|
      t.integer :cooldown
      t.integer :alert_method
      t.string :alert_target

      t.timestamps
    end
  end
end
