require_dependency "deal_redemptions/application_controller"

module DealRedemptions
  class WelcomeController < ApplicationController
    def index
      @companies = Company.active_by_name
    end
  end
end
