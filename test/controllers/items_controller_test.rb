require 'test_helper'

class ItemsControllerTest < ActionController::TestCase
  def create_business
    @business = Business.create!(name: "Test Business", address: "Test Address",
                                 city: "Jakarta", user: @user)
  end

  def create_item
    @item = Item.create!(name: "Green Tea Latte", price: 35_000, business: @business)
  end

  setup do
    @user = User.create!(email: "test@test.com", password: "testpassword",
                         first_name: "Test", last_name: "Test")
    @item_hash = { name: "Double shot", price: 40_000 }
  end

  test 'should get index' do
    create_business
    login

    get :index
    assert_response :success
    assert_template :index
  end

  test 'should create business when not have it yet' do
    login

    get :index
    assert_redirected_to new_business_path
  end

  test 'should get new' do
    create_business
    login

    get :new
    assert_response :success
    assert_template :new
  end

  test 'should create item' do
    create_business
    login

    assert_difference('Item.count') do
      post :create, item: @item_hash
    end

    assert_redirected_to items_path
  end

  test 'should get edit' do
    create_business
    create_item
    login

    get :edit, id: @item
    assert_response :success
  end

  test 'should update item' do
    create_business
    create_item
    login

    patch :update, id: @item, item: @item_hash
    assert_redirected_to items_path
    assert_equal 'Double shot', assigns(:item).name
    assert_equal 40_000, assigns(:item).price
  end

  test 'should destroy item' do
    create_business
    create_item
    login

    assert_difference('Item.count', -1) do
      delete :destroy, id: @item
    end

    assert_redirected_to items_path
  end
end