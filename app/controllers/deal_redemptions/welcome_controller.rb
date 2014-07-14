require_dependency "deal_redemptions/application_controller"

module DealRedemptions
  class WelcomeController < ApplicationController
    def index
      @companies = Company.all.order(:name)
    end
  end
end
