require "rails_helper"

RSpec.describe "Registration", :type => :request do
  it "can load signup page" do 
    get '/signup'
    expect(response).to render_template(:new)
  end

  it "can signup a user" do 
    post '/users', :user => {:first_name => "Test", :last_name => "Test", :email => "test@test.com",
                      :password => "test123*", :password_confirmation => "test123*"}

    expect(response).to redirect_to '/login'
    follow_redirect!

    expect(response).to render_template(:new)
    expect(response.body).to include("Registration was successful.")
  end
end