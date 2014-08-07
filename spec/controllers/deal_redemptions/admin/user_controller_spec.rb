require 'rails_helper'

module DealRedemptions
  RSpec.describe Admin::UserController, :type => :controller do
    routes { DealRedemptions::Engine::routes }

    before :each do
      @user = FactoryGirl.create(:user_2)
    end

    let(:valid_session) { { admin_user_id: @user.id } }
    let(:user_params) { FactoryGirl.attributes_for(:user_2) }
    let(:unvalid_user_params) { FactoryGirl.attributes_for(:user_2, email: '') }

    describe 'POST #create' do

      context 'successful user creation' do
        before :each do
          post :create, { user: user_params }, valid_session
        end

        it 'redirects to admin settings' do
          expect(response).to redirect_to(admin_settings_path)
        end

        it 'flash notice should be New user was created.' do
          expect(flash[:notice]).to eq("New user was created.")
        end
      end

      context 'unsuccessful user creation' do
        before :each do
          post :create, { user: unvalid_user_params }, valid_session
        end

        it 'redirects to admin settings' do
          expect(response).to redirect_to(admin_settings_path)
        end

        it "flash alert should be email can't be blank" do
          expect(flash[:alert]).to eq("Email can't be blank and Email is invalid")
        end
      end
    end

    describe 'DELETE #destory' do
      before :each do
        delete :destroy, { id: @user.id }, valid_session
      end

      it 'redirects to admin settings' do
        expect(response).to redirect_to(admin_settings_path)
      end

      context 'on successful removal' do
        it 'flash notice after destroy should be User was successfully removed.' do
          expect(flash[:notice]).to eq('User was successfully removed.')
        end
      end
    end
  end
end
