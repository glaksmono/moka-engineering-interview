require 'test_helper'

class BusinessesControllerTest < ActionController::TestCase
  setup do
    @user = User.create!(first_name: "Magic", last_name: "Rails", email: "magic_rails@mail.com", password: "123456")
  end

  test 'should redirect to Current User show after Create Business' do
    session[:user_id] = @user.id
    post :create, business: { name: "Business Grow", address: "Little Guard", city: "Balesar" }
    assert_redirected_to @user
  end

  test 'should redirect to Current User show after Update Business' do
    session[:user_id] = @user.id
    old_business = Business.create!(name: "Mini Business", address: "-", city: "Burguay")
    new_business = { name: "Business Grow", address: "Little Guard", city: "Balesar" }
    patch :update, id: old_business, business: new_business
    assert_redirected_to @user
  end

  test 'should redirect to Current User show after Destroy Business' do
    session[:user_id] = @user.id
    business = Business.create!(name: "Mini Business", address: "-", city: "Burguay")
    delete :destroy, id: business
    assert_redirected_to @user
  end

end
