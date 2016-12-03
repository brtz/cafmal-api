class Worker < ApplicationRecord

  validates :uuid, uniqueness: true
end
