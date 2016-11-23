class User < ApplicationRecord
  has_secure_password

  enum role: [:admin, :user, :worker, :alerter]
  belongs_to :team

  validates :email, uniqueness: true

  def admin?
    self.role == "admin"
  end

  def user?
    self.role == "user"
  end

  def worker?
    self.role == "worker"
  end

  def alerter?
    self.role == "alerter"
  end

  def to_token_payload
    payload = {}
    payload['sub'] = self.id
    payload['role'] = self.role
    payload['firstname'] = self.firstname
    payload['lastname'] = self.lastname
    payload['email'] = self.email
    payload['team_id'] = self.team_id
    return payload
  end
end
