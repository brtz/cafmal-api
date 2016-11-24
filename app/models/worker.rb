class Worker < ApplicationRecord
  enum supported_sourcetype: [:influxdb, :elasticsearch]

  validates :uuid, uniqueness: true
  validates :supported_sourcetype, presence: true
  validates :heartbeat_received_at, presence: true
end
