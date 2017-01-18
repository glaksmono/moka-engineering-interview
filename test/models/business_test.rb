require 'test_helper'

class BusinessTest < ActiveSupport::TestCase
  test "should not saved without Name" do
    business = Business.new(address: 'Magical Street', city: 'The Rails')
    assert_not business.save
  end

  test "should not saved without Address" do
    business = Business.new(name: 'Magic Rails', city: 'The Rails')
    assert_not business.save
  end

  test "should not saved without City" do
    business = Business.new(name: 'Magic Rails', address: 'Magical Street')
    assert_not business.save
  end

  test "should saved with complete fields" do
    business = Business.new(name: 'Magic Rails', address: 'Magical Street', city: 'The Rails')
    assert business.save
  end
end
