require 'test_helper'

class AuthControllerTest < ActionDispatch::IntegrationTest
  setup do
    @email = users(:rox).email
    @name = 'Jon'
    @new_email = 'jondoe@mail.com'
    @password = 'secret123'
    @valid_header = { email: @email, password: @password }
    @resource = users(:rox)
  end

  test 'should signin' do
    post new_user_session_url, headers: @valid_header, as: :json
    assert_equal 200, response.status
    assert_equal 'rox@mail.com', response.header['uid']
  end

  test 'should Email registration' do
    post user_registration_url,
         params: { email: @new_email,
                   password: @password,
                   password_confirmation: @password,
                   name: @name }, as: :json
    payload = response_body
    assert_equal 200, response.status
    assert_equal @new_email, payload['data']['email']
    assert_equal @name, payload['data']['name']
  end

  test 'should destroy user' do
    # update token, generate updated auth headers for response
    auth_header = @resource.create_new_auth_token
    assert_difference('User.count', -1) do
      delete user_registration_url, headers: auth_header, as: :json
    end
    payload = response_body
    assert_equal 200, response.status
    assert payload['message']
  end

  test 'should update users name' do
    auth_header = @resource.create_new_auth_token
    put  user_registration_url, headers: auth_header,
         params: { name: 'rox'}, as: :json
    data = response_body['data']
    assert_equal 200, response.status
    assert_equal 'rox', data['name']
  end

  test 'should update users password' do
    auth_header = @resource.create_new_auth_token
    put  user_registration_url, headers: auth_header,
         params: { password: '12345678', password_confirmation: '12345678'},
         as: :json
    assert_equal 200, response.status
  end

  test 'should update users password via put on /password' do
    auth_header = @resource.create_new_auth_token
    put  user_password_url, headers: auth_header,
         params: { password: '12345678', password_confirmation: '12345678'},
         as: :json
    body = response_body
    assert body['message']
    assert_equal 200, response.status
  end

  test 'should invalidate the user authentication token' do
    auth_header = @resource.create_new_auth_token
    delete destroy_user_session_url, headers: auth_header
    assert_equal 200, response.status
  end

  test 'should send a password reset confirmation email' do
    auth_header = @resource.create_new_auth_token
    assert_difference 'ActionMailer::Base.deliveries.size', +1 do
      post user_password_url, headers: auth_header,
           params: { email: @email,
                     redirect_url: "http://localhost:3000#{email_send_path}" }
    end
    assert response_body['message']
    assert_equal 200, response.status
  end
end
