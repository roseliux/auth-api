require 'test_helper'

class AuthControllerTest < ActionDispatch::IntegrationTest
  setup do
    @valid_header = {
      'CONTENT_TYPE': 'application/json',
      'email': 'rox@mail.com',
      'password': 'secret123'
    }
  end

  test "should get index" do
    # post new_user_session_url, headers: @valid_header, as: :json
    post new_user_session_url,
         headers: {
          email: 'rox@mail.com',
          password: 'secret123'
         }, xhr: true
    assert_equal 200, response.status
    assert_equal 'rox@mail.com', response.header['uid']
  end

end
