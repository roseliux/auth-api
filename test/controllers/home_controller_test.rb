require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get 401 when get index" do
    get home_index_url
    assert_response 401
  end

  test "should get guest" do
    get root_url, as: :json
    assert_response :success
  end

end
