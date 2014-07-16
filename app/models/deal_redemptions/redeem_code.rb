module DealRedemptions
  class RedeemCode < ActiveRecord::Base
    belongs_to :company
    belongs_to :product
    belongs_to :redemption

    validates :code, presence: true

    enum status: { void: 0, active: 1, redeemed: 2 }
  end
end