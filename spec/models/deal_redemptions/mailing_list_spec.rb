require 'rails_helper'

module DealRedemptions
  RSpec.describe MailingList, :type => :model do
    before :each do
      @mailing = FactoryGirl.build(:mailing_list_1)
    end

    context 'validations' do
      it { should validate_presence_of(:email_address) }
      it { should validate_uniqueness_of(:email_address) }
    end
  end
end
