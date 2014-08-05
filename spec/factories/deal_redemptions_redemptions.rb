module DealRedemptions
  FactoryGirl.define do
    factory :redemption, :class => Redemption do
      id 1
      company_id 1
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

    factory :redemption_2, :class => Redemption do
      id 2
      company_id 1
      first_name "John"
      last_name "Smith"
      email_address "john@smith.com"
      phone "6616005555"
      address1 "200 S Street Rd"
      address2 ""
      city "Valencia"
      state "CA"
      zip_code "91355"
      country "United States"
      comments ""
    end

    factory :redemption_3, :class => Redemption do
      id 3
      company_id 1
      first_name "Joan"
      last_name "Smithson"
      email_address "joan@smithson.com"
      phone "6618881111"
      address1 "3000 E Street Rd"
      address2 ""
      city "Valencia"
      state "CA"
      zip_code "91355"
      country "United States"
      comments "Please redeem voucher."
    end
  end
end
