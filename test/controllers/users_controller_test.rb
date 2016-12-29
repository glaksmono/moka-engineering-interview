require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user_hash = {
      email: "test@test.com",
      password: "testpassword",
      password_confirmation: "testpassword",
      first_name: "Test",
      last_name: "Test"
    }
  end

  test 'should create user' do
    assert_difference('User.count') do
      post :create, user: @user_hash
    end

    assert_redirected_to items_path
  end

  test 'should fail create user on invalid params' do
    @user_hash.delete(:password)
    post :create, user: @user_hash

    assert_template :new
  end
end
