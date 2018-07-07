require 'test_helper'

class StepDayLogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @step_day_log = step_day_logs(:one)
  end

  test "should get index" do
    get step_day_logs_url
    assert_response :success
  end

  test "should get new" do
    get new_step_day_log_url
    assert_response :success
  end

  test "should create step_day_log" do
    assert_difference('StepDayLog.count') do
      post step_day_logs_url, params: { step_day_log: { date: @step_day_log.date, step_count: @step_day_log.step_count } }
    end

    assert_redirected_to step_day_log_url(StepDayLog.last)
  end

  test "should show step_day_log" do
    get step_day_log_url(@step_day_log)
    assert_response :success
  end

  test "should get edit" do
    get edit_step_day_log_url(@step_day_log)
    assert_response :success
  end

  test "should update step_day_log" do
    patch step_day_log_url(@step_day_log), params: { step_day_log: { date: @step_day_log.date, step_count: @step_day_log.step_count } }
    assert_redirected_to step_day_log_url(@step_day_log)
  end

  test "should destroy step_day_log" do
    assert_difference('StepDayLog.count', -1) do
      delete step_day_log_url(@step_day_log)
    end

    assert_redirected_to step_day_logs_url
  end
end
