require_dependency "deal_redemptions/application_controller"

module DealRedemptions
  class Admin::RedemptionsController < ApplicationController
    layout 'deal_redemptions/admin/default'

    before_action :admin_authorize

    # GET /admin/redemptions
    def index
      # Check if search param is present
      if params[:search].blank?
        @redemptions = DealRedemptions::Redemption.page(params[:page]).order_desc.includes(:company)
      else
        query = DealRedemptions::Redemption.find_by_sql(build_search_query)
        @redemptions = Kaminari.paginate_array(query).page(params[:page])
      end
    end

    # GET /admin/redemptions/1
    def show
      @redemption = DealRedemptions::Redemption.includes(:redeem_code).find(params[:id])
    end

    private

    def build_search_query
      string = params[:search].split ' '
      redemptions = DealRedemptions::Redemption.arel_table
      companies = DealRedemptions::Company.arel_table
      query = redemptions.project(
        redemptions[:id],
        redemptions[:company_id],
        redemptions[:first_name],
        redemptions[:last_name],
        redemptions[:email_address],
        redemptions[:created_at]
      )
      .join(companies)
      .on(redemptions[:company_id]
          .eq(companies[:id]))

      string.each do |s|
        query.where(redemptions[:first_name].matches("%#{s}%").or(redemptions[:last_name].matches("%#{s}%")))
      end

      query.to_sql
    end
  end
end
