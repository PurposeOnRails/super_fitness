require 'test_helper'

class StepDayLogTest < ActiveSupport::TestCase
  def setup
    @log = StepDayLog.new(step_count: 123, date: Date.today)
  end

  test 'instance is valid' do
    assert @log.valid?
  end

  test 'as_json returns the appropriate data' do
    assert_equal (
      {
        step_count: @log.step_count,
        date: @log.date
      }
    ),
    @log.as_json
  end
end
