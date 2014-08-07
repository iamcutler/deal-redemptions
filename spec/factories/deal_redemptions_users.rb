module DealRedemptions
  FactoryGirl.define do
    factory :user, class: User do
      id 1
      first_name "John"
      last_name "Doe"
      email "johndoe@gmail.com"
      password "test123"
    end

    factory :user_2, class: User do
      sequence(:id) { |n| "#{n}" }
      first_name "John"
      last_name "Doe"
      sequence(:email) { |n| "testemail#{n}@gmail.com" }
      password "test123"
    end
  end
end
