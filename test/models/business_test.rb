require 'test_helper'

class BusinessTest < ActiveSupport::TestCase
  should belong_to(:user)
  should have_many(:items)
end
