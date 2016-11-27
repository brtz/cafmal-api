class RenameColumnConditionAggegratorToConditionAggregatorFromChecks < ActiveRecord::Migration[5.0]
  def change
    rename_column :checks, :condition_aggegrator, :condition_aggregator
  end
end
