# encoding: UTF-8
# frozen_string_literal: true

class Worker < ApplicationRecord
  validates :uuid, uniqueness: true
  validates :uuid, presence: true
end
