module DealRedemptions
  FactoryGirl.define do
    factory :mailing_list_1, class: MailingList do
      first_name 'John'
      last_name 'Doe'
      email_address 'joedoe@joedoe.com'
    end
  end
end