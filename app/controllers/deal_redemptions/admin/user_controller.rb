require_dependency "deal_redemptions/application_controller"

module DealRedemptions
  class Admin::UserController < ApplicationController
    before_action :admin_authorize

    def new
    end

    def create
      @user = DealRedemptions::User.new(user_params)

      respond_to do |format|
        if @user.save
          format.html { redirect_to admin_settings_path, notice: 'New user was created.' }
        else
          format.html { redirect_to admin_settings_path, alert: @user.errors.full_messages.to_sentence }
        end
      end
    end

    def edit
    end

    def update
      @user = DealRedemptions::User.find(params[:id])

      respond_to do |format|
        if @user.update_attributes(user_params)
          format.html { redirect_to admin_settings_path, notice: 'Successfully updated your password. Please use it the next time you login.' }
        else
          format.html { redirect_to admin_settings_path, alert: @user.errors.full_messages.to_sentence }
        end
      end
    end

    def destroy
      @user = DealRedemptions::User.find(params[:id])

      respond_to do |format|
        if @user.destroy
          format.html { redirect_to admin_settings_path, notice: 'User was successfully removed.' }
        else
          format.html { redirect_to admin_settings_path, alert: 'Could not remove user. Please try again.' }
        end
      end
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
  end
end
