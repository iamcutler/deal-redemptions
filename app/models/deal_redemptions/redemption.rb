module DealRedemptions
  class Redemption < ActiveRecord::Base
    belongs_to :redeem_transaction, foreign_key: 'transaction_id'
    has_one :redeem_code

    validates :first_name, :last_name, :email_address, :address1, :state, :zip_code, :country, presence: true
  end
end
