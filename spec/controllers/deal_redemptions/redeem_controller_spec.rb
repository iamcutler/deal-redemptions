require 'rails_helper'

module DealRedemptions
  RSpec.describe RedeemController, :type => :controller do
    routes { DealRedemptions::Engine.routes }

    describe 'GET #new' do
      before(:each) do
        @company = FactoryGirl.create(:company)
      end

      it 'redirects with no valid deal site company' do
        get :new, company: ''

        expect(response).to redirect_to(root_path)
      end

      it 'responds with 200 on valid deal site company' do
        get :new, company: @company.slug

        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      it 'render new template' do
        get :new, company: @company.slug

        expect(response).to render_template('new')
      end
    end
  end
end
