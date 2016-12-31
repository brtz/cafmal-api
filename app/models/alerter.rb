# encoding: UTF-8
# frozen_string_literal: true

class Alerter < ApplicationRecord
  enum supported_targets: [:email, :slack, :webhook, :jira_issue]

  validates :uuid, uniqueness: true
  validates :supported_targets, presence: true
end
