require "application_system_test_case"

class HeartRateLogsTest < ApplicationSystemTestCase
  setup do
    @heart_rate_log = heart_rate_logs(:one)
  end

  test "visiting the index" do
    visit heart_rate_logs_url
    assert_selector "h1", text: "Heart Rate Logs"
  end

  test "creating a Heart rate log" do
    visit heart_rate_logs_url
    click_on "New Heart Rate Log"

    fill_in "Date", with: @heart_rate_log.date
    fill_in "Heart Rate", with: @heart_rate_log.heart_rate
    click_on "Create Heart rate log"

    assert_text "Heart rate log was successfully created"
    click_on "Back"
  end

  test "updating a Heart rate log" do
    visit heart_rate_logs_url
    click_on "Edit", match: :first

    fill_in "Date", with: @heart_rate_log.date
    fill_in "Heart Rate", with: @heart_rate_log.heart_rate
    click_on "Update Heart rate log"

    assert_text "Heart rate log was successfully updated"
    click_on "Back"
  end

  test "destroying a Heart rate log" do
    visit heart_rate_logs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Heart rate log was successfully destroyed"
  end
end
