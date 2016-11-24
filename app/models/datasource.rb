class Datasource < ApplicationRecord
  enum sourcetype: [:influxdb, :elasticsearch]
  has_many :checks

  validates :sourcetype, presence: true
  validates :address, presence: true
  validates :port, presence: true
  validates :protocol, presence: true
end
