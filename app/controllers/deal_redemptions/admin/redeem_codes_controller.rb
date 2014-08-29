require_dependency "deal_redemptions/application_controller"

module DealRedemptions
  class Admin::RedeemCodesController < ApplicationController
    layout 'deal_redemptions/admin/default'

    before_action :admin_authorize
    before_action :set_admin_redeem_code, only: [:edit, :update, :destroy]
    before_action :check_existing_company_code, only: [:update, :create]

    # GET /admin/redeem_codes
    def index
      @admin_redeem_codes = DealRedemptions::RedeemCode.page(params[:page]).order(:code).includes(:company)
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

      # Only allow a trusted parameter "white list" through.
      def redeem_code_params
        params.require(:redeem_code).permit(:company_id, :product_id, :code, :status)
      end
  end
end
