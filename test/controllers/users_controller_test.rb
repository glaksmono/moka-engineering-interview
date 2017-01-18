require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = User.create!(first_name: "Magic", last_name: "Rails", email: "magic_rails@mail.com", password: "123456")
  end

  test 'should redirect to root path after Signup' do
    post :create, user: { first_name: "Stuart", last_name: "Little", email: "stuart_little@mail.com",
                          password: "password", password_confirmation: "password" }
    assert_redirected_to root_path
  end

  test 'should redirect to Current User show after Edit Profile' do
    session[:user_id] = @user.id
    edit_profile = {first_name: "New Magic", last_name: "Rails", email: "magic_rails@mail.com", password: "101010"}
    patch :update, id: @user, user: edit_profile
    assert_redirected_to @user
  end
end
