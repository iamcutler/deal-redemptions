module DealRedemptions
  class Redemption < ActiveRecord::Base
    belongs_to :redeem_transaction, foreign_key: 'transaction_id'
    has_many :redeem_code

    accepts_nested_attributes_for :redeem_code, update_only: true

    validates :first_name, :last_name, :email_address, :address1, :city, :state, :zip_code, :country, presence: true
  end
end
