require "rails_helper"

module DealRedemptions
  RSpec.describe AdminUserMailer, :type => :mailer do
    describe 'new confirmation' do
      let(:user) { FactoryGirl.create(:user_2) }
      let(:mail) { AdminUserMailer.new_confirmation(user) }

      context 'renders the headers' do
        it 'subject' do
          expect(mail.subject).to eq("New User Confirmation")
        end

        it 'destination' do
          expect(mail.to).to eq([user.email])
        end

        it 'sender' do
          expect(mail.from).to eq(["noreply@domain.com"])
        end
      end
    end
  end
end
