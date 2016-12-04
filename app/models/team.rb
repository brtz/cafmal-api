class Team < ApplicationRecord
  has_many :users
  has_many :checks
  has_many :alerts

  validates :name, presence: true
  validates :name, uniqueness: true
end
