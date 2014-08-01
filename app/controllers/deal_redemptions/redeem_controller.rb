require_dependency "deal_redemptions/application_controller"

module DealRedemptions
  class RedeemController < ApplicationController
    before_action :find_company, except: [:validate_code, :thankyou]

    def new
      @transaction = DealRedemptions::RedeemTransaction.new
      @redemption = @transaction.build_redemption
    end

    def create
      redeem = DealRedemptions::Redemptions::Redeem.new(@company)

      begin
        ActiveRecord::Base.transaction do
          # save transaction for redemption
          @transaction = DealRedemptions::RedeemTransaction.create!(transaction_params)
          # Save redemption information
          @redemption = @transaction.build_redemption
          @redemption.save
        end

        redirect_to thank_you_path
      rescue
        render :new, notice: 'Something went wrong. Please try again.'
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

    def transaction_params
      params.require(:redeem_transaction).permit(:company, :company_id, redemption_attributes: [:first_name, :last_name, :email_address, :phone, :address1, :address2, :city, :state, :zip_code, :country, :comments, :mailing_list, { redeem_code_attributes: [:code] }])
    end
  end
end
