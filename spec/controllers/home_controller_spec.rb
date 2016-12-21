require 'rails_helper'

RSpec.describe HomeController, :type => :controller do
  describe "GET index" do 
    context "logged in" do 
      before(:each) do 
        login_user
      end

      it "should redirect to items page" do 
        get :index
        expect(response).should redirect_to "/items"
      end
    end

    context "not logged in" do 
      it "should redirect to login page" do 
        get :index
        expect(response).should redirect_to "/login"
      end
    end
  end
end