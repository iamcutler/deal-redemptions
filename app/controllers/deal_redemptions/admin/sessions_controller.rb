require_dependency "deal_redemptions/application_controller"

module DealRedemptions
  class Admin::SessionsController < ApplicationController
    layout '/deal_redemptions/admin/auth'

    def new
    end

    def create
      user = DealRedemptions::User.authenticate(params[:email], params[:password])
      if user
        session[:admin_user_id] = user.id
        redirect_to admin_dashboard_path
      else
        flash[:notice] = 'Invalid email or password'
        render :new
      end
    end

    def destroy
      session[:admin_user_id] = nil
      redirect_to admin_login_path
    end
  end
end
