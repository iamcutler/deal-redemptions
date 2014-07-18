module DealRedemptions
  FactoryGirl.define do
    factory :company, class: Company do
      id 1
      name 'Groupon'
      description 'Please use the 2nd code, not internal code.'
      url 'http://www.groupon.com'
      slug 'groupon'
      active 1
    end

    factory :company2, class: Company do
      id 2
      name 'Living Social'
      description 'Please use the 2nd code, not internal code.'
      url 'http://www.livingsocial.com'
      slug 'livingsocial'
      active 1
    end
  end
end