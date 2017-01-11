require 'test_helper'

class BusinessesControllerTest < ActionController::TestCase
  setup do
    @user = User.create!(email: "test@test.com", password: "testpassword",
                         first_name: "Test", last_name: "Test")
    @business_hash = {
      name: "Test Business", address: "Test Address",
      city: "Jakarta", user: @user
    }
    session[:user_id] = @user.id
  end

  test 'should get new' do
    get :new
    assert_response :success
    assert_template :new
  end

  test 'should create business' do
    assert_difference('Business.count') do
      post :create, business: @business_hash
    end

    assert_redirected_to items_path
  end
end
