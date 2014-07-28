require "rails_helper"

module DealRedemptions
  RSpec.describe Admin::RedemptionsController, :type => :routing do
    routes { DealRedemptions::Engine::routes }
    describe "routing" do
      describe "admin/import" do
        it "routes to #index" do
          expect(get: "admin/transfer").to route_to("deal_redemptions/admin/import#index")
        end
      end
    end
  end
end
