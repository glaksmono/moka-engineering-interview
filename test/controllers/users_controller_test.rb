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

    @userUpdate = {
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

  test "should get edit" do
    create_user
    login
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    create_user
    login
    patch :update, id: @user, user: @userUpdate
    assert_redirected_to items_path
  end
end
