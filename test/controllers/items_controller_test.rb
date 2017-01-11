require 'test_helper'

class ItemsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup do
    @role = Role.create!(
      name: "Admin", 
      description: "Can perform any CRUD operation on any resource"
      )
    
  	@user = User.create!(
  		first_name: "Test ",
  		last_name:"User", 
  		email: "test@example.com",
  		password:"password",
      role: @role,
  		password_confirmation:"password")

  	@item_hash = {
  		name: "Updated Test Item",
  		price: 20000, 
  		business: @business}
  	end

  	def create_business
  		@business = Business.create!(
  			name: "Business Test ",
  			address:"Biz address test", 
  			city: "Biz City Test", 
  			user: @user)
  	end

  	def create_item
  		@item = Item.create!(
  			name: "Test Item",
  			price: 10000, 
  			business: @business)
  	end

  	test 'should get index' do
  		create_business
  		login

  		get :index
  		assert_template :index
  		assert_response :success
  	end  

  	test 'should redirect to create business if business doesnt exists' do
  		login
  		get:index

  		assert_redirected_to new_business_path
  		assert_response :redirect
  	end

  	test 'should redirect to new' do
  		create_business
  		login

  		get:new
  		assert_template :new
  		assert_response :success
  	end

  	test 'should create item' do
  		create_business
  		login

  		assert_difference('Item.count') do
  			post :create, item: @item_hash
  		end

  		assert_redirected_to items_path
  		assert_response :redirect
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
      assert_response :redirect
      assert_equal 'Updated Test Item', assigns(:item).name
      assert_equal 20000, assigns(:item).price
    end

    test 'should destroy item' do
      create_business
      create_item
      login

      assert_difference('Item.count', -1) do
        delete :destroy, id: @item
      end

      assert_redirected_to items_path
      assert_response :redirect
    end
end
