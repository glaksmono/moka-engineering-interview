require 'rails_helper'
require 'pp'

describe UsersController do
  describe "POST create" do
    it 'creates a valid user' do
      post :create, user: attributes_for(:user)
      expect(User.count).to eq(1)
    end

    it 'does not create a user with mismatching passwords' do
      post :create, user: attributes_for(:user, :mismatched_passwords)
      expect(User.count).to eq(0)
      expect(response).to render_template :new
    end
  end
end