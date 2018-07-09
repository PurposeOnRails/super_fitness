class User < ApplicationRecord
  before_save { email.downcase! }

  validates :name, presence: true

  validates :email,
    presence: true,
    uniqueness: { case_sensitive: false },
    format: { with: URI::MailTo::EMAIL_REGEXP }

  # validates :password,
  #   presence: true,
  #   length: { minimum: 8 }

  has_secure_password

  has_many :step_day_logs
  has_many :heart_rate_logs

  def User.digest(string)
    cost = \
      if ActiveModel::SecurePassword.min_cost
        BCrypt::Engine::MIN_COST
      else
        BCrypt::Engine.cost
      end
    BCrypt::Password.create(string, cost: cost)
  end

  def as_json(options = {})
    {
      name: self.name,
      email: self.email,
      date_of_birth: self.date_of_birth,
      gender: self.gender,
      phone_number: self.phone_number,
      steps: self.step_day_logs.map(&:as_json),
      heart_rate: self.heart_rate_logs.map(&:as_json)
    }
  end
end
