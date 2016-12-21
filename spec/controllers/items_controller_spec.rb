require 'rails_helper'

RSpec.describe ItemsController, :type => :controller do
  # emulate logged in user for all cases
  before(:each) do 
    login_user
  end
  
  describe "GET index" do 
    context "without business defined" do 
      it "should redirect to create business page" do 
        get :index
        expect(response).should redirect_to '/businesses/new' 
      end
    end

    context "with business defined" do 
      before(:each) do 
        current_user.business = FactoryGirl.create(:business)
      end
      
      it "should redirect to items" do 
        get :index
        expect(response).to have_http_status(200)
      end
    end
  end

  describe "POST create" do 
    before(:each) do 
      # the user must have a business first
      current_user.business = FactoryGirl.create(:business)
    end

    it "can create a new item" do 
      post :create, :item => {name: "test item", price: 20}

      expect(response).to redirect_to '/items'
    end

    it "can validates price to be greater than zero" do 
      post :create, :item => {name: "test item", price: -4}

      # check that item contains validation error
      assigns(:item).errors.empty?.should be_falsey
    end
  end
end