require 'rails_helper'

module DealRedemptions
  RSpec.describe Redemption, :type => :model do
    before(:each) do
      @redemption = FactoryGirl.build(:redemption)
    end

    context 'validations' do
      it { should validate_presence_of(:first_name) }
      it { should validate_presence_of(:last_name) }
      it { should validate_presence_of(:email_address) }
      it { should validate_presence_of(:address1) }
      it { should validate_presence_of(:state) }
      it { should validate_presence_of(:zip_code) }
      it { should validate_presence_of(:country) }

      it 'passed with all required attributes' do
        expect(@redemption).to be_valid
      end
    end
  end
end
