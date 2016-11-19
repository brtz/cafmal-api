class Alert < ApplicationRecord
  enum alert_method: [:email, :slack, :webhook, :jira_issue]
  enum minimum_severity: [:info, :warning, :critical, :error]

  belongs_to :team
end
