require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
  	@item = Item.new(name: "Test Item", price:"10000")
  end

  test "should be valid" do
  	assert @item.valid?
  end

  test "name should be present" do
  	@item.name = " "
  	assert_not @item.valid?
  end

  test "price should be present" do
  	@item.price = " "
  	assert_not @item.valid?
  end

  test "name should not be too long" do
    @item.name = "a" * 151
    assert_not @item.valid?
  end

  test "price should be numeric" do
  	@item.price = 40
  	assert @item.valid?
  end

  test "price should not be string" do
  	@item.price = "forty"
  	assert_not @item.valid?
  end
end
