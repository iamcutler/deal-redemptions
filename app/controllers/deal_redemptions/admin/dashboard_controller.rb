require_dependency "deal_redemptions/application_controller"

module DealRedemptions
  class Admin::DashboardController < ApplicationController
    layout '/deal_redemptions/admin/default'

    def index
    end
  end
end
