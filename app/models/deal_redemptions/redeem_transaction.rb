module DealRedemptions
  class RedeemTransaction < ActiveRecord::Base
    belongs_to :company
    has_one :redemption, foreign_key: 'transaction_id'
    has_many :redeem_code, through: :redemption

    accepts_nested_attributes_for :redemption, allow_destroy: true
  end
end
