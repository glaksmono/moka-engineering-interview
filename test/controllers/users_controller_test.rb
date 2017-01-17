require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = {
   		first_name: "W",
   		last_name:"N", 
   		email: "w@n.com",
   		password:"12345678",
   		password_confirmation:"12345678"
    }

    @user_update = {
      first_name: "A",
      last_name: "B",
      email: "a@b.com",
      password: "123456",
      password_confirmation: "123456"
    }
  end

  def create_user
    @user = User.create!(
   		first_name: "W",
   		last_name:"N", 
   		email: "w@n.com",
   		password:"12345678",
   		password_confirmation:"12345678"
    )
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: @user
    end

    assert_redirected_to '/login'
  end

  test 'should fail if first_name is empty' do
 		@user.delete(:first_name)
 		post :create, user: @user
 		assert_response(302)
 	end

 	test 'should fail if last_name is empty' do
 		@user.delete(:last_name)
 		post :create, user: @user
 		assert_response(302)
 	end

 	test 'should fail if email is empty' do
 		@user.delete(:email)
 		post :create, user: @user
 		assert_response(302)
 	end

  test "should get edit" do
    create_user
    login
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    create_user
    login
    patch :update, id: @user, user: @user_update
    assert_redirected_to items_path
  end
end
