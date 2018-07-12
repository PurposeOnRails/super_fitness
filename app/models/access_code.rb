class AccessCode < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  before_validation :generate_code

  validates :description, presence: true
  validates :purpose_id, presence: true
  validates :code, presence: true, uniqueness: true, length: { is: 32 }

  belongs_to :purpose

  private

    def generate_code
      self.code = SecureRandom.alphanumeric(32)
    end
end
