require 'test_helper'

class ApiControllerTest < ActionDispatch::IntegrationTest
  test 'retrieve user accepts user_id and purpose' do
    get '/api/user/1/purpose/3'
    assert_response :success
    assert_equal ({ user_id: '1', purpose: '3' }.to_json), @response.body
  end

  test 'retrieve users accepts purpose' do
    get '/api/users/purpose/3'
    assert_response :success
    assert ({ purpose: '3' }.to_json), @response.body
  end
end
