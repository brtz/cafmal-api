# encoding: UTF-8
# frozen_string_literal: true

class Datasource < ApplicationRecord
  enum sourcetype: [:influxdb, :elasticsearch]
  has_many :checks

  validates :sourcetype, presence: true
  validates :address, presence: true
  validates :name, uniqueness: true
  validates :name, presence: true
end
