require 'test_helper'

class BusinessesControllerTest < ActionController::TestCase
  def create_business
    @business = Business.create!(name: "Test Business", address: "Test Address",
                                 city: "Jakarta", user: @user)
  end

  setup do
    @user = User.create!(email: "test@test.com", password: "testpassword",
                         first_name: "Test", last_name: "Test")
    @business_hash = {
      name: "Test Business", address: "Test Address",
      city: "Jakarta", user: @user
    }
  end

  test 'should get new' do
    login(@user)
    get :new
    assert_response :success
    assert_template :new
  end

  test 'when business exist, should redirected to items' do
    create_business
    login(@user)

    get :new
    assert_redirected_to root_path
  end

  test 'should create business' do
    login(@user)
    assert_difference('Business.count') do
      post :create, business: @business_hash
    end

    assert_redirected_to items_path
  end
end
