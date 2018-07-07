require "application_system_test_case"

class AccessCodesTest < ApplicationSystemTestCase
  setup do
    @access_code = access_codes(:one)
  end

  test "visiting the index" do
    visit access_codes_url
    assert_selector "h1", text: "Access Codes"
  end

  test "creating a Access code" do
    visit access_codes_url
    click_on "New Access Code"

    fill_in "Code", with: @access_code.code
    fill_in "Description", with: @access_code.description
    fill_in "Purpose", with: @access_code.purpose_id
    click_on "Create Access code"

    assert_text "Access code was successfully created"
    click_on "Back"
  end

  test "updating a Access code" do
    visit access_codes_url
    click_on "Edit", match: :first

    fill_in "Code", with: @access_code.code
    fill_in "Description", with: @access_code.description
    fill_in "Purpose", with: @access_code.purpose_id
    click_on "Update Access code"

    assert_text "Access code was successfully updated"
    click_on "Back"
  end

  test "destroying a Access code" do
    visit access_codes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Access code was successfully destroyed"
  end
end
