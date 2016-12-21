FactoryGirl.define do 
  factory :user do 
    email Faker::Internet.email
    password "test123"
    password_confirmation "test123"
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
  end

  factory :user_with_invalid_email, :parent => :user do 
    email "invalid@emailcom"
    password "test123"
    password_confirmation "test123"
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
  end
end