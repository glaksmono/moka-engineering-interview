require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'valid user' do
    user = users(:good)

    assert user.valid?
  end

  test 'invalid without first name' do
    user = users(:first_name_missing)
    refute user.valid?, 'user is valid without a first name'
    assert_not_empty user.errors[:first_name], 'no validation error for first name present'
  end

  test 'invalid without last name' do
    user = users(:last_name_missing)
    refute user.valid?, 'user is valid without a last name'
    assert_not_empty user.errors[:last_name], 'no validation error for last name present'
  end

  test 'invalid without email' do
    user = users(:email_missing)
    refute user.valid?
    assert_not_empty user.errors[:email]
  end

  test 'full name' do
    user = users(:good)
    assert_equal  "John Elton", user.full_name, 'full_name function is broken'
  end
end
