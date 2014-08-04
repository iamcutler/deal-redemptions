module DealRedemptions
  class RedeemCode < ActiveRecord::Base
    belongs_to :company
    belongs_to :product
    belongs_to :redemption

    validates :code, presence: true

    scope :redeemed, -> { where(status: 2) }

    enum status: { void: 0, active: 1, redeemed: 2 }

    # Validate redemption code as an active voucher
    def validate_code(params)
      if self.company.slug == params[:company] && self.active?
        true
      else
        false
      end
    end

    def self.find_all_by_code(codes=[])
      where(code: codes)
    end
  end
end
