require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get login_path
    assert_response :success
    assert_template 'sessions/new'
  end

  test 'failed login re-renders and shows error' do
    get login_path
    assert_template 'sessions/new'

    post login_path, params: { session: { email: '', password: '' } }
    assert_template 'sessions/new'
    assert flash[:danger] == 'Password or email not valid'
  end
end
