require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
  	@user = {
  		first_name: "Test ",
  		last_name:"User", 
  		email: "test@example.com",
  		password:"password",
  		password_confirmation:"password"}
  	end

  	test 'should redirect to new' do
  		get :new
  		assert_template :new
  		assert_response :success
  	end

  	test 'should create user successfully' do
  		assert_difference('User.count') do
  			post :create, user: @user
  		end

  		assert_redirected_to login_path	
  	end

  	test 'should fail create user if first_name is empty' do
  		@user.delete(:first_name)
  		post :create, user: @user
  		assert_template :new
  		assert_response :success
  	end

  	test 'should fail create user if last_name is empty' do
  		@user.delete(:last_name)
  		post :create, user: @user
  		assert_template :new
  		assert_response :success
  	end

  	test 'should fail create user if email is empty' do
  		@user.delete(:email)
  		post :create, user: @user
  		assert_template :new
  		assert_response :success
  	end

	  	
end
