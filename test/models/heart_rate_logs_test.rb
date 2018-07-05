require 'test_helper'

class HeartRateLogsTest < ActiveSupport::TestCase
  def setup
    @log = HeartRateLog.new(
      heart_rate: { some: 'json' }.to_json,
      date: Date.today
    )
  end

  test 'instance is valid' do
    assert @log.valid?
  end

  test 'as_json returns appropriate fields' do
    assert_equal (
      {
        heart_rate: { some: 'json' }.to_json,
        date: Date.today
      }
    ),
    @log.as_json
  end
end
