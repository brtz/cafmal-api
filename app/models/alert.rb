class Alert < ApplicationRecord
  enum alert_method: [:email, :slack, :webhook, :jira_issue]
  enum minimum_severity: [:info, :warning, :critical, :error]

  belongs_to :team
  validates :cooldown, presence: true
  validates :alert_method, presence: true
  validates :alert_target, presence: true
  validates :is_enabled, presence: true
  validates :minimum_severity, presence: true
end
