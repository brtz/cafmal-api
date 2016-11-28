class AddColumnConditionValueToChecks < ActiveRecord::Migration[5.0]
  def change
    add_column :checks, :condition_value, :float
  end
end
