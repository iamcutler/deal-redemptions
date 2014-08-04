require 'rails_helper'

module DealRedemptions
  RSpec.describe DealRedemptions::Redemptions::Redeem do
    let(:redeem) { DealRedemptions::Redemptions::Redeem.new(FactoryGirl.create(:company)) }

    context 'validates redemption codes' do
      subject { redeem }

      before :each do
        @redeem_code = FactoryGirl.create :redeem_code
      end

      it 'has all valid codes' do
        allow(subject).to receive(:validate_redeem_codes).with([@redeem_code]) { 0 }

        expect(subject.validate_redeem_codes([@redeem_code])).to eq(0)
      end
    end
  end
end