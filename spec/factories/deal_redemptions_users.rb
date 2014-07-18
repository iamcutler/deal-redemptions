module DealRedemptions
  FactoryGirl.define do
    factory :user, class: User do
      id 1
      first_name "John"
      last_name "Doe"
      email "johndoe@gmail.com"
      password "test123"
    end
  end
end
