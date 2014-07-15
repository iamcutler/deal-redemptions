module DealRedemptions
  FactoryGirl.define do
    factory :redeem_code, :class => RedeemCode do
      company_id 1
      product_id 1
      redemption_id 1
      code 123456789
      status 1
    end
  end
end
