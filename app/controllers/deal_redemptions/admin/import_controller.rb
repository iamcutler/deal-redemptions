require_dependency "deal_redemptions/application_controller"

module DealRedemptions
  class Admin::ImportController < ApplicationController
    layout 'deal_redemptions/admin/default'

    before_action :admin_authorize

    def index
    end
  end
end
