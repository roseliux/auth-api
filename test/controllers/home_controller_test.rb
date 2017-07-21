require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get home_index_url
    assert_response :success
  end

  test "should get not_auth" do
    get home_not_auth_url
    assert_response :success
  end

end
