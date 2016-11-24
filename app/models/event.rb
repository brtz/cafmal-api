class Event < ApplicationRecord
  # we need to reduce the default to a sane amount
  scope :limited, -> { where("created_at >= ?", Time.now.utc - 3600.seconds) }

  enum severity: [:info, :warning, :critical, :error]
  enum kind: [:check, :alert, :login]

  belongs_to :team

  validates :name, presence: true
  validates :message, presence: true
  validates :kind, presence: true
  validates :severity, presence: true
end
