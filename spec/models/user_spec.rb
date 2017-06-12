require 'rails_helper'

describe User do
  it 'has a valid user' do
    expect(build(:user)).to be_valid
  end

  it 'is invalid without first_name' do
    expect(build(:user, :no_first_name)).to_not be_valid
  end

  it 'is invalid without last_name' do
    expect(build(:user, :no_last_name)).to_not be_valid
  end

  it 'is invalid without email' do
    expect(build(:user, :no_email)).to_not be_valid
  end

  it 'is invalid without proper email id' do
    expect(build(:user, :invalid_email)).to_not be_valid
  end

  it 'is invalid with shorter password' do
    expect(build(:user, :short_password)).to_not be_valid
  end

  it 'returns proper full name' do
    expect(build(:user).full_name).to eq("Jack Sparrow")
  end

  it 'validates correct current_password' do
    user = create(:user)
    user.current_password = "jackal123"
    user.password = "new_password"
    user.password_confirmation = "new_password"

    expect(user).to be_valid
  end

  it 'is invalid with incorrect current_password' do
    user = create(:user)
    user.current_password = "something"
    user.password = "new_password"
    user.password_confirmation = "new_password"

    expect(user).to_not be_valid
  end
end