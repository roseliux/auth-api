require 'test_helper'

class AuthControllerTest < ActionDispatch::IntegrationTest
  setup do
    @valid_header = {
      email: 'rox@mail.com',
      password: 'secret123'
    }
  end

  test "should signin" do
    post new_user_session_url, headers: @valid_header, as: :json
    assert_equal 200, response.status
    assert_equal 'rox@mail.com', response.header['uid']
  end

end
