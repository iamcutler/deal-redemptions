require 'rails_helper'

module DealRedemptions
  RSpec.describe Product, :type => :model do
    before(:each) do
      @product = FactoryGirl.build(:product)
    end

    context 'validations' do
      it { should validate_presence_of(:name) }

      it 'pass with all required attributes' do
        expect(@product).to be_valid
      end
    end

    it 'includes protocol if not present before validation' do
      product = FactoryGirl.create(:product, url: 'www.redemptions.com')

      expect(product.url).to eq('http://www.redemptions.com')
    end
  end
end
