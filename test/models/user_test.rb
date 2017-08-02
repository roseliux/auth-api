require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @password    = Faker::Internet.password(10, 20)
    @email       = Faker::Internet.email
    @success_url = Faker::Internet.url
    @resource    = User.new
  end

  test 'user should be invalid' do
    assert @resource.invalid?
  end

  test 'user should be valid' do
    @resource.provider = 'email'
    @resource.email = @email
    @resource.password              = @password
    @resource.password_confirmation = @password

    assert @resource.valid?
  end

  test 'model should not save if email is blank' do
    @resource.provider              = 'email'
    @resource.password              = @password
    @resource.password_confirmation = @password

    refute @resource.save
    assert @resource.errors.messages[:email]
  end
end
