require 'rails_helper'

module DealRedemptions
  RSpec.describe Company, :type => :model do
    before(:each) do
      @company = FactoryGirl.build(:company)
    end

    context 'validations' do
      it { should validate_presence_of(:name) }
      it { should validate_uniqueness_of(:name) }

      it { should validate_presence_of(:slug) }
      it { should validate_uniqueness_of(:slug) }

      it 'to pass with required attributes' do
        expect(@company).to be_valid
      end
    end

    it 'includes url protocol if not present' do
      company = FactoryGirl.create(:company, url: 'www.groupon.com')

      expect(company.url).to eq('http://www.groupon.com')
    end
  end
end