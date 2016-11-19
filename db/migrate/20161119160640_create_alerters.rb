class CreateAlerters < ActiveRecord::Migration[5.0]
  def change
    create_table :alerters do |t|
      t.string :uuid
      t.integer :supported_targets
      t.datetime :heartbeat_received_at

      t.timestamps
    end
  end
end
