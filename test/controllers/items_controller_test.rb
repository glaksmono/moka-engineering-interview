require 'test_helper'

class ItemsControllerTest < ActionController::TestCase
  setup do
    @item_admin_user = items(:itemadminuser)
    @item_hash = {
      name: "Updated Test Item",
      price: 20000, 
      business: @business}
  end

  test "should denied get index without login" do
    get :index
    assert_redirected_to new_user_session_path
    assert_response :redirect
  end 

  test "should get index" do
    sign_in users(:adminuser)
    get :index
    assert_response :success
    assert_template :index
  end 

	test 'should redirect to create business if user has no business' do
  	sign_in users(:nobusiness)
		get:index

		assert_redirected_to new_business_path
		assert_response :redirect
	end

	test 'should get new' do
		sign_in users(:adminuser)

		get:new
		assert_template :new
		assert_response :success
	end

  test 'should denied get new for regular user' do
    sign_in users(:regularuser)

    get:new
    assert_response :redirect
    assert_redirected_to root_path
  end

	test 'should create item' do
		sign_in users(:adminuser)

		assert_difference('Item.count') do
			post :create, item: {name: @item_admin_user.name, price: @item_admin_user.price, business_id: @item_admin_user.business_id}
	  end

    assert_redirected_to items_path
    assert_response :redirect
  end

  test 'should denied create item that is not belong to his business' do
    sign_in users(:selleruser)

    assert_difference('Item.count') do
      post :create, item: {name: @item_admin_user.name, price: @item_admin_user.price, business_id: @item_admin_user.business_id}
    end

    assert_response :redirect
    assert_redirected_to items_path
  end

  test 'should get edit' do
    sign_in users(:adminuser)
   
    get :edit, id: @item_admin_user
    assert_response :success
    assert_template :edit
  end

  test 'should denied edit that is not belong to his business' do
    sign_in users(:selleruser)
   
    get :edit, id: @item_admin_user
    assert_response :redirect
    assert_redirected_to root_path
  end

  test 'should update item' do
    sign_in users(:adminuser)

    patch :update, id: @item_admin_user, item: @item_hash
    assert_redirected_to items_path
    assert_response :redirect
    assert_equal 'Updated Test Item', assigns(:item).name
    assert_equal 20000, assigns(:item).price
  end

  test 'should denied update that is not belong to his business' do
    sign_in users(:selleruser)
   
    patch :update, id: @item_admin_user, item: @item_hash
    assert_response :redirect
    assert_redirected_to root_path
  end

  test 'should destroy item' do
    sign_in users(:adminuser)

    assert_difference('Item.count', -1) do
      delete :destroy, id: @item_admin_user
    end
    assert_redirected_to items_path
    assert_response :redirect
  end  

  test 'should denied destroy that is not belong to his business' do
    sign_in users(:selleruser)
    delete :destroy, id: @item_admin_user
    assert_response :redirect
    assert_redirected_to root_path
  end
end
