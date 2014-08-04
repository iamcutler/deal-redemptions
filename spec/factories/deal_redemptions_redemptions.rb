module DealRedemptions
  FactoryGirl.define do
    factory :redemption, :class => Redemption do
      id 1
      transaction_id 1
      first_name "John"
      last_name "Doe"
      email_address "john@doe.com"
      phone "6615557897"
      address1 "1600 N Street Rd"
      address2 ""
      city "Valencia"
      state "CA"
      zip_code "91351"
      country "United States"
      comments "Comments going here."
    end
  end
end
