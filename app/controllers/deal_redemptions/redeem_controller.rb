require_dependency "deal_redemptions/application_controller"

module DealRedemptions
  class RedeemController < ApplicationController
    before_action :find_company, except: [:validate_code, :thankyou]

    def new
      @company = Company.find_by_slug(params[:company])

      end
    end

    # Thank you page after successful redemption
    def thankyou
    end

    # Validate valid redemption codes
    def validate_code
      redeem_code = DealRedemptions::RedeemCode.find_by_code(params[:code])
      if redeem_code
        @redeem = redeem_code.validate_code(params)
      else
        @redeem = false
      end
    end

    private

    def find_company
      @company = Company.find_by_slug(params[:company])

      unless @company
        redirect_to root_path
      end
    end
  end
end
