class RenameColumnConditionOperandToConditionOperator < ActiveRecord::Migration[5.0]
  def change
    rename_column :checks, :condition_operand, :condition_operator
  end
end
