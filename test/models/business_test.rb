require 'test_helper'

class BusinessTest < ActiveSupport::TestCase
  setup do
    @business = businesses(:businessadminuser)
  end

  test "should be valid" do
  	assert @business.valid?
  end

  test "name should be present" do
  	@business.name = " "
  	assert_not @business.valid?
  end

  test "address should be present" do
  	@business.address = " "
  	assert_not @business.valid?
  end

  test "city should be present" do
  	@business.city = " "
  	assert_not @business.valid?
  end

  test "name should not be too long" do
  	@business.name = "a" * 151
  	assert_not @business.valid?
  end

  test "city should not be too long" do
  	@business.city = "a" * 151
  	assert_not @business.valid?
  end
end
