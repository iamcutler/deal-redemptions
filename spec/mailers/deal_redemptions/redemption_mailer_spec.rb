require "rails_helper"

module DealRedemptions
  RSpec.describe RedemptionMailer, :type => :mailer do
    describe "confirmation" do
      let(:redemption) { FactoryGirl.create(:redemption) }
      let(:mail) { RedemptionMailer.confirmation(redemption) }

      context 'renders the headers' do
        it 'subject' do
          expect(mail.subject).to eq("Redemption Confirmation")
        end

        it 'destination' do
          expect(mail.to).to eq([redemption.email_address])
        end

        it 'sender' do
          expect(mail.from).to eq(["noreply@domain.com"])
        end
      end
    end
  end
end
