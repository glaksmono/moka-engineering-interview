require "rails_helper"

RSpec.describe User, :type => :model do
  it "should validate email is valid" do
    user = FactoryGirl.build(:user_with_invalid_email)

    expect(user.valid?).to be_falsey
  end
end