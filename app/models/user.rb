class User < ApplicationRecord
  has_secure_password

  enum role: [:admin, :user, :worker, :alerter]
  belongs_to :team

  validates :email, uniqueness: true
end
