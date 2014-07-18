require 'rails_helper'

module DealRedemptions
  RSpec.describe User, :type => :model do
    let(:user) { FactoryGirl.build(:user) }

    context 'validations' do
      it { should validate_presence_of(:first_name) }
      it { should validate_presence_of(:last_name) }
      it { should validate_presence_of(:email) }
      it { should validate_presence_of(:password) }

      it { should validate_uniqueness_of(:email) }

      it 'will not save user with a non-valid email format' do
        user = FactoryGirl.build(:user, email: '')

        expect(user.save).to eq(false)
      end
    end

    context 'valid password encryption using bcrypt' do
      it 'password hash populated' do
        user.save
        expect(user.password_hash).to_not be_nil
      end

      it 'generated and stored password salt' do
        user.save
        expect(user.password_salt).to_not be_nil
      end
    end

    it 'log_last_login assigns current time before saving' do
      user.save
      expect(user.last_login).to_not be_nil
    end
  end
end
