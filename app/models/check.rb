class Check < ApplicationRecord
  enum category: [:system, :application, :misc]
  enum condition_operand: [:lowerThan, :greaterThan]
  enum condition_aggregator: [:sum, :average, :invalue, :distinct]
  enum severity: [:info, :warning, :critical, :error]

  belongs_to :team
  belongs_to :datasource
end
