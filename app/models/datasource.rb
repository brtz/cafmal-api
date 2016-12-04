class Datasource < ApplicationRecord
  enum sourcetype: [:influxdb, :elasticsearch]
  has_many :checks

  validates :sourcetype, presence: true
  validates :address, presence: true
  validates :name, uniqueness: true
end
