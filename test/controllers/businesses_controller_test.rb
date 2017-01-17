require 'test_helper'

class BusinessesControllerTest < ActionController::TestCase
  setup do
    @user = User.create!(
   		first_name: "W",
   		last_name:"N", 
   		email: "w@n.com",
   		password:"12345678",
   		password_confirmation:"12345678"
    )

    @business = {
      name: "Try Cafe",
      address: "Address Location",
      city: "The City",
      user: @user
    }

    @business_update = {
      name: "Cafe Boss",
      address: "Address 2",
      city: "City 2",
      user: @user
    }
  end

 	def create_business
    @business = Business.create!(
      name: "Try Cafe",
      address: "Address Location",
      city: "The City",
      user: @user
    )
  end

  test "should get new" do
  	login
    get :new
    assert_template :new
    assert_response :success
  end

  test "should create business" do
    login
    assert_difference('Business.count') do
      post :create, business: @business
    end

    assert_redirected_to items_path
  end

  test 'should fail if name is empty' do
    login
 		@business.delete(:name)
 		post :create, business: @business
 		assert_response(302)
 	end

 	test 'should fail if address is empty' do
    login
 		@business.delete(:address)
 		post :create, business: @business
 		assert_response(302)
 	end

 	test 'should fail if city is empty' do
    login
 		@business.delete(:city)
 		post :create, business: @business
 		assert_response(302)
 	end

  test "should get edit" do
    login
    create_business
    get :edit, id: @business
    assert_response :success
  end

  test "should update business" do
    login
    create_business
    patch :update, id: @business, business: @business_update
    assert_redirected_to items_path
  end
end
