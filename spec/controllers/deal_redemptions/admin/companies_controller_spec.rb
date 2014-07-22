require 'rails_helper'

module DealRedemptions
  RSpec.describe Admin::CompaniesController, :type => :controller do
    routes { DealRedemptions::Engine::routes }

    let(:valid_session) { { admin_user_id: 1 } }

    before(:each) do
      @user = FactoryGirl.create(:user)
    end

    describe 'GET #index' do
      before(:each) do
        get :index, nil, valid_session
      end

      it 'returns successful 200' do
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      it 'assigns @companies' do
        expect(assigns(:companies)).to_not be_nil
      end
    end

    describe 'GET #new' do
      it 'returns 200 status' do
        get :new, nil, valid_session

        expect(response).to be_success
        expect(response).to have_http_status(200)
      end
    end

    describe 'POST #create' do
      before(:each) do
        @attr = FactoryGirl.attributes_for(:company)
        session[:admin_user_id] = 1
      end

      it 'save new company successfully' do
        post :create, company: @attr

        expect(response).to redirect_to(admin_companies_path)
      end

      it 'send successful flash notice' do
        post :create, company: @attr

        expect(flash[:notice]).to eq('Company successfully added.')
      end

      it 'redirects to new on unsuccessful create' do
        post :create, company: FactoryGirl.attributes_for(:company, name: '')

        expect(response).to render_template :new
      end
    end

    describe 'GET #edit' do
      it 'assigns @company' do
        company = @company
        get :edit, { id: 1 }, valid_session

        expect(assigns(:company)).to eq(company)
      end

      it 'redirects if id param is not found' do
        get :edit, { id: 100000 }, valid_session
        expect(response).to redirect_to(admin_companies_path)
      end
    end

    describe 'PUT #update' do
      before(:each) do
        @company = FactoryGirl.create(:company)
        session[:admin_user_id] = 1
      end

      it 'should redirect to companies #index on successful update' do
        put :update, id: @company.id, company: FactoryGirl.attributes_for(:company)

        expect(response).to redirect_to admin_companies_path
      end

      it 'shows flash notice after success' do
        put :update, id: @company.id, company: FactoryGirl.attributes_for(:company)

        expect(flash[:notice]).to eq('Company was successfully updated.')
      end

      it 'should render edit if unsuccessful update' do
        put :update, id: @company.id, company: FactoryGirl.attributes_for(:company, name: '')

        expect(response).to render_template :edit
      end
    end

    describe 'DELETE #destory' do
      before(:each) do
        @company = FactoryGirl.create(:company)
        session[:admin_user_id] = 1
      end

      it 'redirects after successful destory' do
        delete :destroy, id: @company.id

        expect(response).to redirect_to admin_companies_path
      end

      it 'shows flash notice after destory' do
        delete :destroy, id: @company.id

        expect(flash[:notice]).to eq('Company was successfully removed.')
      end
    end
  end
end
