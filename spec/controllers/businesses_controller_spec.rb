require 'rails_helper'

describe BusinessesController do
  describe "POST create" do
    it 'creates a valid business' do
      post :create, business: attributes_for(:business)
      business = Business.first
      post :create, business: attributes_for(:business)
    end

    it 'does not create a business with no name' do
      post :create, business: attributes_for(:business, :no_name)
      expect(Business.count).to eq(0)
      expect(response).to render_template :new
    end
  end
end