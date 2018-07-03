class User < ApplicationRecord
  before_save { email.downcase! }

  validates :name, presence: true

  validates :email,
    presence: true,
    uniqueness: { case_sensitive: false },
    format: { with: URI::MailTo::EMAIL_REGEXP }

  validates :password,
    presence: true,
    length: { minimum: 8 }

  has_secure_password

  def User.digest(string)
    cost = \
      if ActiveModel::SecurePassword.min_cost
        BCrypt::Engine::MIN_COST
      else
        BCrypt::Engine.cost
      end
    BCrypt::Password.create(string, cost: cost)
  end
end
