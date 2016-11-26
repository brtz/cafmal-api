class Alerter < ApplicationRecord
  enum supported_targets: [:email, :slack, :webhook, :jira_issue]

  validates :uuid, uniqueness: true
  validates :supported_targets, presence: true
end
