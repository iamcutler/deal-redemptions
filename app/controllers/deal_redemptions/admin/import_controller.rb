require_dependency "deal_redemptions/application_controller"

module DealRedemptions
  class Admin::ImportController < ApplicationController
    layout 'deal_redemptions/admin/default'

    before_action :admin_authorize

    def new
      @companies = DealRedemptions::Company.find_active
      @products = DealRedemptions::Product.all
    end

    def create
      # Check if file is CSV type
      if params[:file].content_type == 'text/csv'
        @importer = DealRedemptions::Admin::Importer.new(params[:company], params[:product])
        if @importer.import_codes_csv(params[:file])
          redirect_to admin_import_path, notice: 'Redemption codes were successfully uploaded.'
        else
          redirect_to admin_import_path, alert: 'Make sure you\'re not uploading existing codes. Please reference your file again.'
        end
      else
        redirect_to admin_import_path, alert: 'Please only upload CSV formatted files'
      end
    end

    def export
    end
  end
end
