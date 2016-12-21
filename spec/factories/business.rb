FactoryGirl.define do 
  factory :business do 
    name Faker::Company.name 
    address Faker::Address.street_name
    city Faker::Address.city
  end
end