require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  
  setup do
    @user = User.create!(email: "test@mail.com", password: "testpassword",
                         first_name: "Tester", last_name: "Moka")
  end

  test 'should redirected to items' do
    login

    get :index
    assert_redirected_to items_path
  end

  test 'when not login, should redirected to login' do
    get :index
    assert_redirected_to login_path
  end

end