FactoryGirl.define do
  factory :business do
    name "Juice Center"
    address "Church St."
    city "Boston NY"
    user_id 4

    trait :no_name do
      name nil
    end

    trait :no_address do
      address nil
    end
  end
end