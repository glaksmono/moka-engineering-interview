require 'test_helper'

class ItemsControllerTest < ActionController::TestCase
  setup do
    @user = User.create!(email: "test@test.com", password: "testpassword",
                         first_name: "Test", last_name: "Test")
    @business = Business.create!(name: "Test Business", address: "Test Address",
                                 city: "Jakarta", user: @user)
    @item = Item.create!(name: "Green Tea Latte", price: 35_000, business: @business)
    @item_hash = { name: "Double shot", price: 40_000 }
    session[:user_id] = @user.id
  end

  test 'should get new' do
    get :new
    assert_response :success
    assert_template :new
  end

  test 'should create item' do
    assert_difference('Item.count') do
      post :create, item: @item_hash
    end

    assert_redirected_to item_path(assigns(:item))
  end

  test 'should show item' do
    get :show, id: @item
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @item
    assert_response :success
  end

  test 'should update item' do
    patch :update, id: @item, item: @item_hash
    assert_redirected_to item_path(assigns(:item))
    assert_equal 'Double shot', assigns(:item).name
    assert_equal 40_000, assigns(:item).price
  end

  test 'should destroy item' do
    assert_difference('Item.count', -1) do
      delete :destroy, id: @item
    end

    assert_redirected_to items_path
  end
end
