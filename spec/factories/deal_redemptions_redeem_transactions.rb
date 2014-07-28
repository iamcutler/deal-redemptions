module DealRedemptions
  FactoryGirl.define do
    factory :redeem_transaction, :class => RedeemTransaction do
      id 1
      company_id 1
    end

    factory :redeem_transaction_2, :class => RedeemTransaction do
      id 2
      company_id 2
    end

    factory :redeem_transaction_3, :class => RedeemTransaction do
      id 3
      company_id 3
    end
  end
end