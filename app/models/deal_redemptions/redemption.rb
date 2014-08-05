module DealRedemptions
  class Redemption < ActiveRecord::Base
    belongs_to :company
    has_many :redeem_code

    attr_accessor :mailing_list, :city

    accepts_nested_attributes_for :redeem_code, update_only: true

    validates :first_name, :last_name, :email_address, :address1, :city, :state, :zip_code, :country, presence: true
  end
end
