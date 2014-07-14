require 'rails_helper'

module DealRedemptions
  RSpec.describe RedeemTransaction, :type => :model do
    context 'validations' do
      it { should belong_to(:company) }
    end
  end
end
