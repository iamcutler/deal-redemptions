require 'rails_helper'

module DealRedemptions
  RSpec.describe Admin::SettingsController, :type => :controller do
    routes { DealRedemptions::Engine::routes }

    let(:user) { FactoryGirl.create(:user) }

    describe 'GET #index' do
      before(:each) do
        get :index
      end

      it 'returns http success' do
        expect(response).to be_success
      end

      it 'assigns @users to fetch users' do
        expect(assigns(:users)).to match_array user
      end
    end

  end
end
