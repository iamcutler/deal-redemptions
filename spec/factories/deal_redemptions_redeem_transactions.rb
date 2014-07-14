module DealRedemptions
  FactoryGirl.define do
    factory :transaction, :class => RedeemTransaction do
      company 1
    end
  end
end