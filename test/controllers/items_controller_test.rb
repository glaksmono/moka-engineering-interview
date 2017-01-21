require 'test_helper'

class ItemsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should get index" do
    get items_url
    assert_response :success, "success request index items"
  end
end
