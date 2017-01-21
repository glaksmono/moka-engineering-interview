require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save user without first_name, last_name, email" do
    user = User.new
    user.first_name = "My First Name"
    user.last_name = "My Last Name"
    user.email = "email@email.com"
    assert_not !user.valid? , "Saved the user without a first_name, last_name, email"
  end
end
