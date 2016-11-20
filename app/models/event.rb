class Event < ApplicationRecord
  # we need to reduce the default to a sane amount
  default_scope { where("created_at >= ?", Time.now.utc - 3600.seconds) }

  enum severity: [:info, :warning, :critical, :error]
  enum kind: [:check, :alert, :login]

  belongs_to :team
end
