require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  def setup
  	@item = Item.new(name: "Try", price:"10")
  end

  test "name required" do
  	@item.name = " "
  	assert_not @item.valid?
  end

  test "price required" do
  	@item.price = " "
  	assert_not @item.valid?
  end

  test "price should not be string" do
  	@item.price = "forty"
  	assert_not @item.valid?
  end
end
