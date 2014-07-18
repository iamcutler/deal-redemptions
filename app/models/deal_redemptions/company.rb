module DealRedemptions
  class Company < ActiveRecord::Base
    has_one :redeem_transaction
    has_many :redeem_code

    validates :name, :slug, presence: true, uniqueness: true

    scope :active_by_name, -> { where(active: 1) }
    scope :all_by_name, -> { all.order(:name) }
  end
end
