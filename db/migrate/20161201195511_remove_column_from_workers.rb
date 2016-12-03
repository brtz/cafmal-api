class RemoveColumnFromWorkers < ActiveRecord::Migration[5.0]
  def change
    remove_column :workers, :supported_sourcetype, :integer
  end
end
