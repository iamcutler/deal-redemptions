module DealRedemptions
  class RedeemTransaction < ActiveRecord::Base
    belongs_to :company
    has_many :redemption, foreign_key: 'transaction_id'
    has_many :redeem_code, through: :redemption
  end
end
