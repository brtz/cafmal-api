class Alerter < ApplicationRecord
  enum supported_targets: [:email, :slack, :webhook, :jira_issue]
  
  validates :uuid, uniqueness: true
end
