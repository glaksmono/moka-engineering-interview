require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'valid user' do
    user = User.new(first_name: 'John', last_name: 'Elton', email: 'john@example.com', password: "abcd1234", password_confirmation: "abcd1234")

    assert user.valid?
  end

  test 'invalid without first_name' do
    user = User.new(last_name: 'Elton', email: 'john@example.com', password: "abcd1234", password_confirmation: "abcd1234")
    refute user.valid?, 'user is valid without a first name'
    assert_not_empty user.errors[:first_name], 'no validation error for first name present'
  end

  test 'invalid without last_name' do
    user = User.new(first_name: 'Elton', email: 'john@example.com', password: "abcd1234", password_confirmation: "abcd1234")
    refute user.valid?, 'user is valid without a last name'
    assert_not_empty user.errors[:last_name], 'no validation error for last name present'
  end

  test 'invalid without email' do
    user = User.new(first_name: 'John', last_name: 'Elton', password: "abcd1234", password_confirmation: "abcd1234")
    refute user.valid?
    assert_not_nil user.errors[:email]
  end
end
