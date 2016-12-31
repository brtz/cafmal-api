# encoding: UTF-8
# frozen_string_literal: true

class Alert < ApplicationRecord
  scope :limited_by_team, ->(team_id) { where('team_id = ?', team_id) }

  enum alert_method: [:email, :slack, :webhook, :jira_issue]
  enum minimum_severity: [:info, :warning, :critical, :error]

  belongs_to :team
  validates :cooldown, presence: true
  validates :alert_method, presence: true
  validates :alert_target, presence: true
  validates :is_enabled, presence: true
  validates :minimum_severity, presence: true
  validates :pattern, length: { minimum: 1 }
end
