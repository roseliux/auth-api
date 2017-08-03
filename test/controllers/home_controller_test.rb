require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  setup do
    @resource = users(:confirmed_email_user)
  end

  test 'should get 200 when get index' do
    new_auth_header = @resource.create_new_auth_token()
    get home_index_url, headers: new_auth_header, xhr: true
    assert_response 200
  end

  test 'should get 401 when get index' do
    get home_index_url
    assert_response 401
  end

  test 'should get guest' do
    get root_url, as: :json
    assert_response :success

    body = response_body
    assert_equal I18n.t('common.welcome'), body['message']
  end

end
