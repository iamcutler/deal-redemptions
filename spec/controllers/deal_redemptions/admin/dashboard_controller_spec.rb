require 'rails_helper'

module DealRedemptions
  RSpec.describe Admin::DashboardController, :type => :controller do
    routes { DealRedemptions::Engine.routes }

    let(:valid_session) { { admin_user_id: 1 } }

    before(:each) do
      FactoryGirl.create(:user)
    end

    describe "GET 'index'" do
    end

  end
end
