require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  setup do
    @user = User.create!(first_name: "Magic", last_name: "Rails", email: "magic_rails@mail.com", password: "123456")
  end

  test 'should redirect to root path after login' do
    post :create, session: { email: "magic_rails@mail.com", password: "123456" }
    assert_redirected_to root_path
  end

  test 'should render same page when login failed' do
    post :create, session: { email: "magic_rails@mail.com", password: "010101" }
    assert_response :success
    assert_template :new
  end

  test 'should redirect to root path after logout' do
    session[:user_id] = @user.id
    delete :destroy
    assert_redirected_to root_path
  end
end
