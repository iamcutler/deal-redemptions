require "rails_helper"

module DealRedemptions
  RSpec.describe Admin::RedeemCodesController, :type => :routing do
    describe "routing" do

      it "routes to #index" do
        expect(:get => "/admin/redeem_codes").to route_to("admin/redeem_codes#index")
      end

      it "routes to #new" do
        expect(:get => "/admin/redeem_codes/new").to route_to("admin/redeem_codes#new")
      end

      it "routes to #show" do
        expect(:get => "/admin/redeem_codes/1").to route_to("admin/redeem_codes#show", :id => "1")
      end

      it "routes to #edit" do
        expect(:get => "/admin/redeem_codes/1/edit").to route_to("admin/redeem_codes#edit", :id => "1")
      end

      it "routes to #create" do
        expect(:post => "/admin/redeem_codes").to route_to("admin/redeem_codes#create")
      end

      it "routes to #update" do
        expect(:put => "/admin/redeem_codes/1").to route_to("admin/redeem_codes#update", :id => "1")
      end

      it "routes to #destroy" do
        expect(:delete => "/admin/redeem_codes/1").to route_to("admin/redeem_codes#destroy", :id => "1")
      end

    end
  end
end
