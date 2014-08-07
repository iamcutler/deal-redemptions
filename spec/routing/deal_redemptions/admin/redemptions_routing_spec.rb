require "rails_helper"

module DealRedemptions
  RSpec.describe Admin::RedemptionsController, :type => :routing do
    routes { DealRedemptions::Engine::routes }
    describe "routing" do
      describe "admin/redemptions" do
        it "routes to #index" do
          expect(:get => "/admin/redemptions").to route_to("deal_redemptions/admin/redemptions#index")
        end

        it "routes to #show" do
          expect(:get => "/admin/redemptions/1").to route_to("deal_redemptions/admin/redemptions#show", :id => "1")
        end
      end
    end
  end
end
