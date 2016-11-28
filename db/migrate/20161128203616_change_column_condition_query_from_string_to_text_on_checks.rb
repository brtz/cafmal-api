class ChangeColumnConditionQueryFromStringToTextOnChecks < ActiveRecord::Migration[5.0]
  def change
    change_column :checks, :condition_query, :text
  end
end
