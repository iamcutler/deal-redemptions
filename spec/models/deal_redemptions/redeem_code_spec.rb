require 'rails_helper'

module DealRedemptions
  RSpec.describe RedeemCode, :type => :model do

    context 'validations' do
      it { should belong_to(:company) }
      it { should belong_to(:product) }
      it { should belong_to(:redemption) }

      it { should validate_presence_of(:code) }
    end

    context 'enum status' do
      before(:each) do
        @redeem_code = FactoryGirl.build(:redeem_code)
      end

      it 'returns void status' do
        @redeem_code.status = 0

        expect(@redeem_code.void?).to eq(true)
      end

      it 'returns active status' do
        @redeem_code.status = 1

        expect(@redeem_code.active?).to eq(true)
      end

      it 'returns redeemed status' do
        @redeem_code.status = 2

        expect(@redeem_code.redeemed?).to eq(true)
      end
    end
  end
end
