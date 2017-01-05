require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  setup do
    @user = User.create!(email: "test@mail.com", password: "testpassword",
                         first_name: "Tester", last_name: "Moka")
  end

  test 'should get new' do
    get :new
    assert_response :success
    assert_template :new
  end

  test 'should login' do
    post :create, session: { email: "test@mail.com", password: "testpassword" }

    assert_redirected_to root_path
  end

  test 'when invalid, back to login page' do
    post :create, session: { email: "test@test.com", password: "password" }

    assert_response :success
    assert_template :new
  end

  test 'should logout' do
    login

    delete :destroy

    assert_redirected_to root_path
  end
end