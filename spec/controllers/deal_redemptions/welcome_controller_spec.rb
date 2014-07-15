require 'rails_helper'

module DealRedemptions
  RSpec.describe WelcomeController, :type => :controller do
    routes { DealRedemptions::Engine.routes }

    describe "GET #index" do
      it 'responds with a successfully 200' do
        get :index

        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      it 'renders index template' do
        get :index

        expect(response).to render_template('index')
      end

      it 'finds all active companies' do
        company = @companies
        get :index, company
        expect(assigns(:company)).to eq(company)
      end
    end
  end
end
