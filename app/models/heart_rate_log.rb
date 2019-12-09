class HeartRateLog < ApplicationRecord

  belongs_to :user

  def as_json(options = {})
    {
      heart_rate: self.heart_rate,
      date: self.date
    }
  end
end
