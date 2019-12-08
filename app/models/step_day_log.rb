class StepDayLog < ApplicationRecord

  belongs_to :user

  def as_json(options = {})
    {
      step_count: self.step_count,
      date: self.date
    }
  end
end
