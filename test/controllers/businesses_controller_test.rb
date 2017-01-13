require 'test_helper'

class BusinessesControllerTest < ActionController::TestCase
  setup do
    @business_admin_user = businesses("businessadminuser")
  	@business_hash = {
  		name: "Business Test",
  		address:"Biz address test", 
  		city: "Biz City Test"}
  end

  test "should denied get new without login" do
    get :new
    assert_redirected_to new_user_session_path
    assert_response :redirect
  end 

  test 'should get new' do
    sign_in users(:adminuser)

  	get :new
  	assert_template :new
  	assert_response :success
  end

  test 'should create business' do
    sign_in users(:nobusiness)
    get :new
    assert_template :new
    assert_response :success
  end

  test 'should get edit' do
    sign_in users(:adminuser)
    get :edit, id: @business_admin_user
    assert_response :success
    assert_template :edit
  end

  test 'should denied edit for regular/seller user' do
    sign_in users(:selleruser)
    get :edit, id: @business_admin_user
    assert_response :redirect
    assert_redirected_to root_path
  end

  test 'should denied edit that is not belong to his busines' do
    sign_in users(:adminuserother)
    get :edit, id: @business_admin_user
    assert_response :redirect
    assert_redirected_to root_path
  end

  test 'should update business' do
    sign_in users(:adminuser)
    patch :update, id: @business_admin_user, business: @business_hash
    assert_redirected_to items_path
    assert_response :redirect
    assert_equal 'Business Test', assigns(:business).name
    assert_equal 'Biz address test', assigns(:business).address
    assert_equal 'Biz City Test', assigns(:business).city
  end

  test 'should denied update that is not belong to his' do
    sign_in users(:adminuserother)
    patch :update, id: @business_admin_user, business: @business_hash
    assert_response :redirect
    assert_redirected_to root_path
  end
end
