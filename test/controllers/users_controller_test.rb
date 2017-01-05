require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user_hash = {
      email: "test@mail.com",
      password: "testpassword",
      password_confirmation: "testpassword",
      first_name: "Tester",
      last_name: "Moka"
    }
  end

  test 'should get new' do
    get :new
    assert_response :success
    assert_template :new
  end

  test 'should create user' do
    assert_difference('User.count') do
      post :create, user: @user_hash
    end

    assert_redirected_to login_path
  end

  test 'should fail create user on invalid params' do
    @user_hash.delete(:first_name)
    post :create, user: @user_hash

    assert_template :new
  end
end