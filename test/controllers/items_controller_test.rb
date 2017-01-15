require 'test_helper'

class ItemsControllerTest < ActionController::TestCase
  setup do
    @user = User.create!(
   		first_name: "W",
   		last_name:"N", 
   		email: "w@n.com",
   		password:"12345678",
   		password_confirmation:"12345678"
    )

    @item = {
      name: "Try",
      price: "10",
      business: @business
    }

    @item_update = {
      name: "Woo",
      price: "20",
      business: @business
    }
  end

 	def create_business
    @business = Business.create!(
      name: "Try Cafe",
      address: "Address Location",
      city: "The City",
      user: @user
    )
  end

  def create_item
    @item = Item.create!(
      name: "Try",
      price: "10",
      business: @business
    )
 	end

  test "should get index" do
    login
    create_business
    get :index
    assert_response :success
    assert_not_nil assigns(:items)
  end

  test "should get new" do
    login
    get :new
    assert_response :success
  end

  test "should create item" do
    login
    create_business
    assert_difference('Item.count') do
      post :create, item: @item
    end

    assert_redirected_to items_path
  end

  test 'should fail if name is empty' do
    login
    create_business
 		@item.delete(:name)
 		post :create, item: @item
 		assert_response(302)
 	end

 	test 'should fail if price is empty' do
    login
    create_business
 		@item.delete(:price)
 		post :create, item: @item
 		assert_response(302)
 	end

  test "should get edit" do
    login
    create_business
    create_item
    get :edit, id: @item
    assert_response :success
  end

  test "should update item" do
    login
    create_business
    create_item
    patch :update, id: @item, item: @item_update
    assert_redirected_to items_path
  end

  test "should destroy item" do
    login
    create_business
    create_item
    assert_difference('Item.count', -1) do
      delete :destroy, id: @item
    end

    assert_redirected_to items_path
  end
end
