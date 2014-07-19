module DealRedemptions
  class ApplicationController < ActionController::Base
    helper_method :current_user

    private

    def current_user
      @current_user ||= DealRedemptions::User.find(session[:admin_user_id]) if session[:admin_user_id]
    end
  end
end
