# encoding: UTF-8
# frozen_string_literal: true

class Alerter < ApplicationRecord
  validates :uuid, uniqueness: true
end
