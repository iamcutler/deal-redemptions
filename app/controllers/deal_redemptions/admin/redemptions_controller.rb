require_dependency "deal_redemptions/application_controller"

module DealRedemptions
  class Admin::RedemptionsController < ApplicationController
    layout 'deal_redemptions/admin/default'

    before_action :admin_authorize

    # GET /admin/redemptions
    def index
      @redemptions = DealRedemptions::Redemption.all.includes(:company)
    end

    # GET /admin/redemptions/1
    def show
      @redemption = DealRedemptions::Redemption.includes(:redeem_code).find(params[:id])
    end

    private
      # Only allow a trusted parameter "white list" through.
      def admin_redemption_params
        params.require(:redemption).permit()
      end
  end
end
