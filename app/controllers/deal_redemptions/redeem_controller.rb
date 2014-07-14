require_dependency "deal_redemptions/application_controller"

module DealRedemptions
  class RedeemController < ApplicationController
    def new
      @company = Company.find_by_slug(params[:company])

      if @company
        @transaction = RedeemTransaction.new
      else
        redirect_to root_path
      end
    end

    def create

    end
  end
end
