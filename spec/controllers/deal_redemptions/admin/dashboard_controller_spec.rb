require 'rails_helper'

module DealRedemptions
  RSpec.describe Admin::DashboardController, :type => :controller do
    routes { DealRedemptions::Engine.routes }

    describe "GET 'index'" do
      it "returns http success" do
        get :index
        expect(response).to be_success
      end
    end

  end
end
