require 'test_helper'

class ItemsControllerTest < ActionController::TestCase
  setup do
    @user = User.create!(first_name: "Magic", last_name: "Rails", email: "magic_rails@mail.com", password: "123456")
    @business = Business.create!(name: "Business Grow", address: "Little Guard", city: "Balesar")
  end

  test 'should redirect to Current User show if Create Business not present' do
    session[:user_id] = @user.id
    get :index
    assert_redirected_to @user
  end

  test 'should display index if Create Business present' do
    session[:user_id] = @user.id
    @user.business = @business
    @user.save
    get :index
    assert_response :success
  end

  test 'should redirect to Item index after Create Items' do
    session[:user_id] = @user.id
    @user.business = @business
    @user.save
    post :create, item: { name: "Moccha Latte", price: 1_000 }
    assert_redirected_to items_path
  end

  test 'should redirect to Item index after Update Items' do
    session[:user_id] = @user.id
    old_item = Item.create!(name: "Moccha Latte", price: 1_000, business: @business)
    new_item = {name: "Moccha Latte", price: 10_000}
    patch :update, id: old_item, item: new_item
    assert_redirected_to items_path
  end

  test 'should redirect to Item index after Destroy Items' do
    session[:user_id] = @user.id
    item = Item.create!(name: "Moccha Latte", price: 1_000, business: @business)
    delete :destroy, id: item
    assert_redirected_to items_path
  end

end
