require_dependency "deal_redemptions/application_controller"

module DealRedemptions
  class RedeemController < ApplicationController
    before_action :find_company, except: [:validate_code, :thankyou]

    def new
      @redemption = DealRedemptions::Redemption.new
    end

    def create
      @redemption = DealRedemptions::Redemption.new(redemption_params)

      redeem = DealRedemptions::Redemptions::Redeem.new(@company)
      redeem_codes = DealRedemptions::RedeemCode.find_all_by_code params[:redeem_codes]

      redeem.validate_redeem_codes redeem_codes do |validate|
        # Returns true, then all codes validated
        if validate
          begin
            ActiveRecord::Base.transaction do
              # Save redemption
              @redeem = DealRedemptions::Redemption.create(redemption_params)
              # Save redemption codes
              redeem_codes.each do |code|
                code.redemption_id = @redeem.id
                code.status = 2
                code.save
              end
            end

            # Save to mailing list if opt in
            if params[:redemption][:mailing_list]
              begin
                redemption = params[:redemption]
                DealRedemptions::MailingList.create(
                  first_name: redemption[:first_name],
                  last_name: redemption[:last_name],
                  email_address: redemption[:email_address]
                )
              end
            end

            # Send confirmation email
            #DealRedemptions::RedemptionMailer.confirmation(@redemption).deliver

            redirect_to thank_you_path and return
          rescue
            flash[:notice] = 'Something went wrong. Please try again.'
            render :new
          end
        else
          flash[:notice] = 'Please make sure to only redeem valid redemption codes.'
          render :new
        end
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

    def redemption_params
      params.require(:redemption).permit(:first_name, :last_name, :email_address, :phone, :address1, :address2, :city, :state, :zip_code, :country, :comments, :mailing_list, :company_id, redeem_codes: [:code])
    end
  end
end
