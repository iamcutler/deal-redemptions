require 'rails_helper'

describe DealRedemptions::Company, :type => :model do
  describe 'validations' do
    before(:each) do
      @company = FactoryGirl.build(:company)
    end

    it 'fails if no name is present' do
      @company.name = ''

      expect(@company).to_not be_valid
    end

    it 'fails if no slug is present' do
      @company.slug = ''

      expect(@company).to_not be_valid
    end

    it 'fails if name is not unique' do
      should validate_uniqueness_of(:name)
    end

    it 'fails if name is not unique' do
      should validate_uniqueness_of(:slug)
    end

    it 'to pass with required attributes' do
      expect(@company).to be_valid
    end
  end
end