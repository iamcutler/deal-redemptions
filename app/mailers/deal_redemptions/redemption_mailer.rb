module DealRedemptions
  class RedemptionMailer < ActionMailer::Base
    default from: "noreply@dealsiteredemptions.com"

    def confirmation(redemption)
      @redemption = redemption

      mail to: redemption.email_address, subject: "#{I18n.t 'redemption_mailer.confirmation.subject'}"
    end
  end
end
