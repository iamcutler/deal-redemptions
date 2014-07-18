require 'rails_helper'

module DealRedemptions
  RSpec.describe Admin::CompaniesController, :type => :controller do
    routes { DealRedemptions::Engine::routes }

    describe 'GET #index' do
      it 'returns successful 200' do
        get :index

        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      it 'assigns @companies' do
        get :index
        expect(assigns(:companies)).to_not be_nil
      end
    end

    describe 'GET #edit' do
      it 'assigns @company' do
        company = @company
        get :edit, { id: 1 }

        expect(assigns(:company)).to eq(company)
      end

      it 'redirects if id param is not found' do
        get :edit, { id: 100000 }
        expect(response).to redirect_to(admin_companies_path)
      end
    end

    describe 'PUT #update' do
      before(:each) do
        @company = FactoryGirl.create(:company)
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
