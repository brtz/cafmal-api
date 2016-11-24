class Check < ApplicationRecord
  enum category: [:system, :application, :misc]
  enum condition_operand: [:lowerThan, :greaterThan]
  enum condition_aggregator: [:agg_sum, :agg_average, :agg_invalue, :agg_distinct]
  enum severity: [:info, :warning, :critical, :error]

  belongs_to :team
  belongs_to :datasource

  validates :category, presence: true
  validates :name, presence: true
  validates :condition_query, presence: true
  validates :condition_operand, presence: true
  validates :condition_aggregator, presence: true
  validates :severity, presence: true
  validates :interval, presence: true
  validates :is_locked, presence: true
  validates :last_ran_at, presence: true
end
