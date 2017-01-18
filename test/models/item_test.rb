require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  test "should not saved without Name" do
    item = Item.new(price: 1000)
    assert_not item.save
  end

  test "should not saved without Price" do
    item = Item.new(name: "Item Tester")
    assert_not item.save
  end

  test "should not saved without Business" do
    item = Item.new(name: "Item Tester", price: 1000)
    assert_not item.save
  end

  test "should saved with Business included" do
    business = Business.create(name: "Business Tester", address: "-", city: "-")
    item = Item.new(name: "Item Tester", price: 1000)
    item.business = business
    assert item.save
  end

  test "should invalid cause Item price should numerical" do
    business = Business.create(name: "Business Tester", address: "-", city: "-")
    item = Item.new(name: "Item Tester", price: '-')
    assert_not item.save
  end

  test "should invalid cause Item price should greater than 0" do
    business = Business.create(name: "Business Tester", address: "-", city: "-")
    item = Item.new(name: "Item Tester", price: 0)
    assert_not item.save
  end
end
