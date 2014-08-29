require_dependency "deal_redemptions/application_controller"

module DealRedemptions
  class Admin::RedeemCodesController < ApplicationController
    layout 'deal_redemptions/admin/default'

    before_action :admin_authorize
    before_action :set_admin_redeem_code, only: [:edit, :update, :destroy]
    before_action :check_existing_company_code, only: [:update, :create]

    # GET /admin/redeem_codes
    def index
      # Check if search param is present
      if params[:search].blank?
        @admin_redeem_codes = DealRedemptions::RedeemCode.page(params[:page]).order(:code).includes(:company)
      else
        query = DealRedemptions::Redemption.find_by_sql(build_search_query)
        @admin_redeem_codes = Kaminari.paginate_array(query).page(params[:page])
      end
    end

    # GET /admin/redeem_codes/new
    def new
      @admin_redeem_code = DealRedemptions::RedeemCode.new
    end

    # GET /admin/redeem_codes/1/edit
    def edit
    end

    # POST /admin/redeem_codes
    def create
      @admin_redeem_code = DealRedemptions::RedeemCode.new(redeem_code_params)

      if @existing_code
        flash[:notice] = 'Redemption code already exists.'
        render :new
      else
        if @admin_redeem_code.save
          redirect_to admin_redeem_codes_path, notice: 'Redeem code was successfully created.'
        else
          render :new
        end
      end
    end

    # PATCH/PUT /admin/redeem_codes/1
    def update
      if @existing_code
        flash[:notice] = 'Redemption code already exists.'
        render :edit
      else
        if @admin_redeem_code.update(redeem_code_params)
          redirect_to admin_redeem_codes_path, notice: 'Redeem code was successfully updated.'
        else
          render :edit
        end
      end
    end

    # DELETE /admin/redeem_codes/1
    def destroy
      @admin_redeem_code.destroy
      redirect_to admin_redeem_codes_url, notice: 'Redeem code was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_admin_redeem_code
        @admin_redeem_code = DealRedemptions::RedeemCode.find(params[:id])
      end

      # Check existing redemption code by company
      def check_existing_company_code
        @existing_code = DealRedemptions::RedeemCode.find_code_by_company(params[:code], params[:company])
      end

      # Search redemption codes
      def build_search_query
        string = params[:search].split ' '
        redeem_codes = DealRedemptions::RedeemCode.arel_table
        companies = DealRedemptions::Company.arel_table
        query = redeem_codes.project(
          redeem_codes[:id],
          redeem_codes[:company_id],
          redeem_codes[:code],
          redeem_codes[:status],
          redeem_codes[:created_at]
        )
        .join(companies)
        .on(redeem_codes[:company_id]
            .eq(companies[:id]))

        string.each do |s|
          query.where(redeem_codes[:code].matches("%#{s}%"))
        end

        query.to_sql
      end

      # Only allow a trusted parameter "white list" through.
      def redeem_code_params
        params.require(:redeem_code).permit(:company_id, :product_id, :code, :status)
      end
  end
end
