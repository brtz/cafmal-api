class CreateWorkers < ActiveRecord::Migration[5.0]
  def change
    create_table :workers do |t|
      t.string :uuid
      t.integer :supported_sourcetype
      t.datetime :heartbeat_received_at

      t.timestamps
    end
  end
end
