require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get new_user_path
    assert_response :success
  end

  test 'invalid signups should display page with errors' do
    get new_user_path

    assert_no_difference 'User.count' do
      post users_path, params: {
        user: {
          name:  '',
          email: 'this is fail',
          password: 'swag',
          password_confirmation: 'yolo'
        }
      }
    end

    assert_template 'users/new'
    assert_select 'div#error_message'
    assert_select 'div.field_with_errors'
  end

  test 'valid signups work' do
    get new_user_path

    assert_difference 'User.count', 1 do
      post users_path, params: {
        user: {
          name:  'hello',
          email: "hello@world.com",
          password: "asdfASDF",
          password_confirmation: "asdfASDF"
        }
      }
    end

    follow_redirect!

    assert_template 'users/show'
  end
end
