module DealRedemptions
  class AdminUserMailer < ActionMailer::Base
    default from: "noreply@dealsiteredemptions.com"

    def new_confirmation(user)
      @user = user

      mail to: user.email, subject: "#{I18n.t 'admin_user_mailer.new_confirmation.subject'}"
    end
  end
end
