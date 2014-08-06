require 'rails_helper'

module DealRedemptions
  RSpec.describe Admin::ImportController, :type => :controller do
    routes { DealRedemptions::Engine::routes }

    before :each do
      @user = FactoryGirl.create(:user)
    end

    let(:valid_session) { { admin_user_id: 1 } }

    describe 'GET #new' do
      before :each do
        @companies = [FactoryGirl.create(:company)]
        @products = [FactoryGirl.create(:product)]

        get :new, {}, valid_session
      end

      context 'assigns instance variable' do
        it 'companies to @companies' do
          expect(assigns(:companies)).to eq(@companies)
        end

        it 'products to @products' do
          expect(assigns(:products)).to eq(@products)
        end
      end
    end
  end
end
