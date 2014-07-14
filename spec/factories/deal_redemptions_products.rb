# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :deal_redemptions_product, :class => 'Product' do
    name "MyString"
    url "MyString"
  end
end
