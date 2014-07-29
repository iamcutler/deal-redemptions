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

    describe 'validate redemption code' do
      before(:each) do
        @company = FactoryGirl.create(:company)
        @code = FactoryGirl.create(:redeem_code)
      end

      it 'return true if code is valid' do
        expect(@code.validate_code({ company: @code.company.slug, code: @code.code })).to eq(true)
      end

      it 'return false if code is used or does not match' do
        expect(@code.validate_code({ company: @code.company.slug, code: '' })).to eq(false)
      end

      it 'return false params are not provided' do
        expect(@code.validate_code({})).to eq(false)
      end
    end
  end
end
