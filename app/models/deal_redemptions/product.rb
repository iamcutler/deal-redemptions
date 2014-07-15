module DealRedemptions
  class Product < ActiveRecord::Base
    has_many :redeem_code

    validates :name, presence: true
  end
end
