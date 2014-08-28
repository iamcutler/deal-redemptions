require_dependency "deal_redemptions/admin/application_controller"

module DealRedemptions
  class Admin::RedeemCodesController < ApplicationController
    before_action :set_admin_redeem_code, only: [:show, :edit, :update, :destroy]

    # GET /admin/redeem_codes
    def index
      @admin_redeem_codes = Admin::RedeemCode.all
    end

    # GET /admin/redeem_codes/1
    def show
    end

    # GET /admin/redeem_codes/new
    def new
      @admin_redeem_code = Admin::RedeemCode.new
    end

    # GET /admin/redeem_codes/1/edit
    def edit
    end

    # POST /admin/redeem_codes
    def create
      @admin_redeem_code = Admin::RedeemCode.new(admin_redeem_code_params)

      if @admin_redeem_code.save
        redirect_to @admin_redeem_code, notice: 'Redeem code was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /admin/redeem_codes/1
    def update
      if @admin_redeem_code.update(admin_redeem_code_params)
        redirect_to @admin_redeem_code, notice: 'Redeem code was successfully updated.'
      else
        render :edit
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
        @admin_redeem_code = Admin::RedeemCode.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def admin_redeem_code_params
        params[:admin_redeem_code]
      end
  end
end
