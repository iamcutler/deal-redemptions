require_dependency "deal_redemptions/application_controller"

module DealRedemptions
  class Admin::CompaniesController < ApplicationController
    layout '/deal_redemptions/admin/default'
    rescue_from ActiveRecord::RecordNotFound, with: :redirect_to_companies

    before_action :set_company, only: [:show, :edit, :update, :destroy]

    def index
      @companies = DealRedemptions::Company.all_by_name
    end

    def new
      @company = DealRedemptions::Company.new
    end

    def create
      @company = DealRedemptions::Company.new(company_params)

      if @company.save
        redirect_to admin_companies_path, notice: 'Company successfully added.'
      else
        render :new
      end
    end

    def edit
    end

    def update
      if @company.update(company_params)
        redirect_to admin_companies_path, notice: 'Company was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      if @company.destroy
        redirect_to admin_companies_path, notice: 'Company was successfully removed.'
      else
        render :edit, notice: 'Company was not removed. Try again'
      end
    end

    protected

      def redirect_to_companies
        redirect_to admin_companies_path
      end

    private

      # Use callbacks to share common setup or constraints between actions.
      def set_company
        @company = DealRedemptions::Company.find(params[:id])
      end

      def company_params
        # Whitelist permitted parameters
        params.require(:company).permit(:name, :description, :url, :slug, :active)
      end
  end
end
