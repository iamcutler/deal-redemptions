module DealRedemptions
  class RedemptionMailer < ActionMailer::Base
    default from: "#{DealRedemptions.config.email_address}"

    def confirmation(redemption)
      @redemption = redemption

      mail to: redemption.email_address, subject: "#{I18n.t 'redemption_mailer.confirmation.subject'}"
    end
  end
end
