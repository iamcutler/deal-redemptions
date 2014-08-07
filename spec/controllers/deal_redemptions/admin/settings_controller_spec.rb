require 'rails_helper'

module DealRedemptions
  RSpec.describe Admin::SettingsController, :type => :controller do
    routes { DealRedemptions::Engine::routes }

    let(:valid_session) { { admin_user_id: 1 } }

    describe 'GET #index' do
      before(:each) do
        @user = FactoryGirl.create(:user)
        get :index, nil, valid_session
      end

      it 'returns http success' do
        expect(response).to be_success
      end

      it 'assigns @users to fetch users' do
        expect(assigns(:users)).to match_array @user
      end

      it 'assigns @new_user to new user instance' do
        expect(assigns(:new_user)).to be_a(DealRedemptions::User)
      end
    end
  end
end
