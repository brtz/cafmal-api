class AddColumnMinimumSeverityToAlert < ActiveRecord::Migration[5.0]
  def change
    add_column :alerts, :minimum_severity, :integer
  end
end
