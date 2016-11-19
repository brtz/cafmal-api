class Check < ApplicationRecord
  enum category: [:system, :application, :misc]
  enum condition_operand: [:lowerThan, :greaterThan]
  enum condition_aggregator: [:agg_sum, :agg_average, :agg_invalue, :agg_distinct]
  enum severity: [:info, :warning, :critical, :error]

  belongs_to :team
  belongs_to :datasource
end
