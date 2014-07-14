module DealRedemptions
  class RedeemTransaction < ActiveRecord::Base
    belongs_to :company
    has_many :redemption
  end
end
