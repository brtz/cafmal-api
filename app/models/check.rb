class Check < ApplicationRecord
  scope :limited_by_team, ->(team_id) { where("team_id >= ?",  team_id) }

  enum category: [:system, :application, :misc]
  enum condition_operator: [:lowerThan, :greaterThan, :lowerThanOrEqual, :greaterThanOrEqual, :equal]
  enum condition_aggregator: [:elasticsearch_count]
  enum severity: [:info, :warning, :critical, :error]

  belongs_to :team
  belongs_to :datasource

  validates :category, presence: true
  validates :name, presence: true
  validates :condition_query, presence: true
  validates :condition_operator, presence: true
  validates :condition_aggregator, presence: true
  validates :severity, presence: true
  validates :interval, presence: true
end
