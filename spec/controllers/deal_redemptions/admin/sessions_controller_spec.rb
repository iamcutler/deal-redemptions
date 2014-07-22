require 'rails_helper'

module DealRedemptions
  RSpec.describe Admin::SessionsController, :type => :controller do
    routes { DealRedemptions::Engine.routes }

    describe "GET 'new'" do
      it "returns http success" do
        get :new
        expect(response).to be_success
      end
    end

  end
end
