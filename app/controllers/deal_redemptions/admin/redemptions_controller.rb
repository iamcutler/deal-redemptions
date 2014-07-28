require_dependency "deal_redemptions/application_controller"

module DealRedemptions
  class Admin::RedemptionsController < ApplicationController
    layout 'deal_redemptions/admin/default'

    before_action :admin_authorize

    # GET /admin/redemptions
    def index
      @transactions = DealRedemptions::RedeemTransaction.all.includes(:redemption, :company)
    end

    # GET /admin/redemptions/1
    def show
      @transaction = DealRedemptions::RedeemTransaction.includes(:redeem_code).find(params[:id])
      @redemption = @transaction.redemption[0]
    end

    private
      # Only allow a trusted parameter "white list" through.
      def admin_redemption_params
        params.require(:redemption).permit()
      end
  end
end
