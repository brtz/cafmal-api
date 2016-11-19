class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :alert_method
      t.string :alert_address

      t.timestamps
    end
  end
end
