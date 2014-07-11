module DealRedemptions
  class MailingList < ActiveRecord::Base
    validates :email_address,
              presence: true,
              uniqueness: true,
              format: { with: /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/ }
  end
end
