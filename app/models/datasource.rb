class Datasource < ApplicationRecord
  enum sourcetype: [:influxdb, :elasticsearch]
  has_many :checks
end
