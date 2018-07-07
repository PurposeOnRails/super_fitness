class HeartRateLog < ApplicationRecord
  def as_json(options = {})
    {
      heart_rate: self.heart_rate,
      date: self.date
    }
  end
end
