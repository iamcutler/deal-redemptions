require 'rails_helper'

describe DealRedemptions::Company, :type => :model do
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
end