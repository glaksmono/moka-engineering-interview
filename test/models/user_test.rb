require 'test_helper'

class UserTest < ActiveSupport::TestCase
  should have_secure_password
  should have_one(:business)
  should validate_presence_of(:first_name)
  should validate_presence_of(:last_name)
  should validate_presence_of(:email)
end
