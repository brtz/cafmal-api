# encoding: UTF-8
# frozen_string_literal: true

class Event < ApplicationRecord
  # we need to reduce the default to a sane amount
  scope :limited_by_age, -> { where('created_at >= ?', Time.now.utc - 3600.seconds) }
  scope :limited_by_team, ->(team_id) { where('team_id = ?', team_id) }

  enum severity: [:info, :warning, :critical, :error]
  enum kind: [:check, :alert, :login]

  belongs_to :team

  validates :name, presence: true
  validates :message, presence: true
  validates :kind, presence: true
  validates :severity, presence: true
end
