require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should not saved without First Name" do
    user = User.new(last_name: "Little", email: "stuart_little@gmail.com")
    assert_not user.save
  end

  test "should not saved without Last Name" do
    user = User.new(first_name: "Stuart", email: "stuart_little@gmail.com")
    assert_not user.save
  end

  test "should not saved without format Email correctly" do
    user = User.new(last_name: "Little", email: "stuart_little")
    assert_not user.save
  end

  test "should not saved if password & confirmation difference" do
    user = User.new(first_name: "Stuart",last_name: "Little", email: "stuart_little@gmail.com",
                    password: '123', password_confirmation: '456')
    assert_not user.save
  end

  test "should saved with all validation passed" do
    user = User.new(first_name: "Stuart",last_name: "Little", email: "stuart_little@gmail.com",
                    password: '123', password_confirmation: '123')
    assert user.save
  end
end
