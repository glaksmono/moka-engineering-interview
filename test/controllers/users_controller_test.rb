require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  def create_business
    @business = Business.create!(name: "Test Business", address: "Test Address",
                                 city: "Jakarta", user: @user)
  end

  def user
    @user ||= User.create!(email: "test@test.com", password: "testpassword",
                           first_name: "Test", last_name: "Test")

  end

  def other_user
    @other_user ||= User.create!(email: "testa@test.com", password: "testpassword",
                                 first_name: "Test", last_name: "Test")
  end

  setup do
    @user_hash = {
      email: "testupdate@test.com",
      password: "testpassword",
      password_confirmation: "testpassword",
      first_name: "Test Update",
      last_name: "Test Update"
    }
  end

  test 'should get new' do
    get :new
    assert_response :success
    assert_template :new
  end

  test 'should create user' do
    assert_difference('User.count') do
      post :create, user: @user_hash
    end

    assert_redirected_to items_path
  end

  test 'should fail create user on invalid params' do
    @user_hash.delete(:password)
    post :create, user: @user_hash

    assert_template :new
  end

  test 'should get show' do
    create_business
    login(user)

    get :show, id: user
    assert_response :success
    assert_template :show
  end

  test 'should get edit' do
    login(user)

    get :edit, id: user.id

    assert_response :success
    assert_template :edit
  end

  test 'when editing other user profile, should redirect back to root' do
    create_business
    login(user)

    get :edit, id: other_user.id

    assert_redirected_to root_path
  end

  test 'should update user' do
    create_business
    login(user)

    patch :update, id: user, user: @user_hash
    assert_redirected_to user_path(assigns(:user))
    assert_equal 'testupdate@test.com', assigns(:user).email
    assert_equal 'Test Update', assigns(:user).first_name
    assert_equal 'Test Update', assigns(:user).last_name
  end

  test 'when editing other user profile, should redirected back to root' do
    create_business
    login(user)

    patch :update, id: other_user, user: @user_hash
    assert_redirected_to root_path
  end

end
