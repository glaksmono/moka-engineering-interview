require 'test_helper'

class BusinessTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
  	@business = Business.new(name: "Try Cafe", address: "Address Location", city: "The City")
  end

  test "name required" do
  	@business.name = " "
  	assert_not @business.valid?
  end

  test "address required" do
  	@business.address = " "
  	assert_not @business.valid?
  end

  test "city required" do
  	@business.city = " "
  	assert_not @business.valid?
  end
end
