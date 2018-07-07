class AccessCode < ApplicationRecord
  before_validation :generate_code

  validates :description, presence: true
  validates :purpose_id, presence: true

  # belongs_to :purpose

  private

    def generate_code
      self.code = SecureRandom.alphanumeric(32)
    end
end
