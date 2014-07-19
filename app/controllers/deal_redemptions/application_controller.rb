module DealRedemptions
  class ApplicationController < ActionController::Base
    helper_method :current_admin_user
    helper_method :admin_authorize

    private

    def current_admin_user
      @current_admin_user ||= DealRedemptions::User.find(session[:admin_user_id]) if session[:admin_user_id]
    end

    def admin_authorize
      redirect_to admin_login_path if current_admin_user.nil?
    end
  end
end
