require_dependency "deal_redemptions/application_controller"

module DealRedemptions
  class Admin::SettingsController < ApplicationController
    layout '/deal_redemptions/admin/default'

    before_action :admin_authorize

    def index
      @users = DealRedemptions::User.all.order(:first_name)
    end
  end
end
