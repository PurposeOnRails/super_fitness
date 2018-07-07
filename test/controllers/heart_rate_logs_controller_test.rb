require 'test_helper'

class HeartRateLogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @heart_rate_log = heart_rate_logs(:one)
  end

  test "should get index" do
    get heart_rate_logs_url
    assert_response :success
  end

  test "should get new" do
    get new_heart_rate_log_url
    assert_response :success
  end

  test "should create heart_rate_log" do
    assert_difference('HeartRateLog.count') do
      post heart_rate_logs_url, params: { heart_rate_log: { date: @heart_rate_log.date, heart_rate: @heart_rate_log.heart_rate } }
    end

    assert_redirected_to heart_rate_log_url(HeartRateLog.last)
  end

  test "should show heart_rate_log" do
    get heart_rate_log_url(@heart_rate_log)
    assert_response :success
  end

  test "should get edit" do
    get edit_heart_rate_log_url(@heart_rate_log)
    assert_response :success
  end

  test "should update heart_rate_log" do
    patch heart_rate_log_url(@heart_rate_log), params: { heart_rate_log: { date: @heart_rate_log.date, heart_rate: @heart_rate_log.heart_rate } }
    assert_redirected_to heart_rate_log_url(@heart_rate_log)
  end

  test "should destroy heart_rate_log" do
    assert_difference('HeartRateLog.count', -1) do
      delete heart_rate_log_url(@heart_rate_log)
    end

    assert_redirected_to heart_rate_logs_url
  end
end
