FactoryGirl.define do
  factory :company, class: DealRedemptions::Company do
    name 'Groupon'
    description 'Please use the 2nd code, not internal code.'
    url 'http://www.groupon.com'
    slug 'groupon'
    active 1
  end

  factory :company2, class: DealRedemptions::Company do
    name 'Living Social'
    description 'Please use the 2nd code, not internal code.'
    url 'http://www.livingsocial.com'
    slug 'livingsocial'
    active 1
  end
end