class Event < ApplicationRecord
  enum severity: [:info, :warning, :critical, :error]

  belongs_to :team
end
