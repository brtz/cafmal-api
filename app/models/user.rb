# encoding: UTF-8
# frozen_string_literal: true

require 'digest'

class User < ApplicationRecord
  has_secure_password

  scope :limited_by_team, ->(team_id) { where('team_id = ?', team_id) }

  enum role: [:admin, :lead, :user, :worker, :alerter]
  belongs_to :team

  validates :email, uniqueness: true
  validates :email, presence: true
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :role, presence: true

  def admin?
    role == 'admin'
  end

  def lead?
    role == 'lead'
  end

  def user?
    role == 'user'
  end

  def worker?
    role == 'worker'
  end

  def alerter?
    role == 'alerter'
  end

  def to_token_payload
    payload = {}
    payload['sub'] = id
    payload['role'] = role
    payload['firstname'] = firstname
    payload['lastname'] = lastname
    payload['email'] = email
    payload['team_id'] = team_id
    payload['hash'] = Digest::SHA256.base64digest updated_at.to_s
    payload
  end
end
