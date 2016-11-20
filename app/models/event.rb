class Event < ApplicationRecord
  enum severity: [:info, :warning, :critical, :error]
  enum kind: [:check, :alert, :login]

  belongs_to :team
end
