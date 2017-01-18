require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  setup do
    @user = User.create!(first_name: "Magic", last_name: "Rails", email: "magic_rails@mail.com", password: "123456")
  end

  test 'should redirected to Current User show if login' do
    session[:user_id] = @user.id
    get :index
    assert_redirected_to @user
  end

  test 'should redirected to login path if not login' do
    get :index
    assert_redirected_to login_path
  end
end
