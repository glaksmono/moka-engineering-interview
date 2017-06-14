FactoryGirl.define do
  factory :user do
    first_name "Jack"
    last_name "Sparrow"
    email "jack@pirates.com"
    password "jackal123"
    password_confirmation "jackal123"
    # password_digest { BCrypt::Password.create('jackal123', cost: 4) }

    trait :no_first_name do
      first_name nil
    end

    trait :no_last_name do
      last_name nil
    end

    trait :no_email do
      email nil
    end

    trait :invalid_email do
      email "jack@pirates"
    end

    trait :short_password do
      password "jack"
      password_confirmation "jack"
    end

    trait :valid_current_password do
      current_password "jackal123"
      password "new_password"
      password_confirmation "new_password"
    end

    trait :invalid_current_password do
      current_password "some_password"
      password "new_password"
      password_confirmation "new_password"
    end

    trait :mismatched_passwords do
      password "jackal123"
      password_confirmation "something_else"
    end
  end
end