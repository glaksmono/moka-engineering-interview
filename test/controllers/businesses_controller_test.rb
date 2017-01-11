require 'test_helper'

class BusinessesControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup do
    @role = Role.create!(
      name: "Admin", 
      description: "Can perform any CRUD operation on any resource"
      )

  	@user = User.create!(
      first_name: "Test ",
  		last_name:"User", 
  		email: "test@example.com",
  		password:"password",
      role: @role,
  		password_confirmation:"password")
  
  	@business = {
  		name: "Business Test ",
  		address:"Biz address test", 
  		city: "Biz City Test"}
  end

  def create
    @business = Business.create!(name: "Business Test ",
  		address:"Biz address test", 
  		city: "Biz City Test", user: @user)
  end

  test 'should redirect to new' do
  	login
  	get :new
  	assert_template :new
  	assert_response :success
  end

  test 'should fail create business if name is empty' do
    login
    @business.delete(:name)
    post :create, business: @business
    assert_template :new
    assert_response :success
  end

  test 'should fail create business if address is empty' do
    login
    @business.delete(:address)
    post :create, business: @business
    assert_template :new
    assert_response :success
  end

  test 'should fail create business if city is empty' do
  	login
    @business.delete(:city)
    post :create, business: @business
    assert_template :new
    assert_response :success
  end
end
