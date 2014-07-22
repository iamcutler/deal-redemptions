module DealRedemptions
  class Company < ActiveRecord::Base
    has_one :redeem_transaction
    has_many :redeem_code

    before_validation :format_url_protocol

    validates :name, :slug, presence: true, uniqueness: true

    scope :active_by_name, -> { where(active: 1) }
    scope :all_by_name, -> { all.order(:name) }

    private

    def format_url_protocol
      if self.url.present?
        unless self.url[/^http:\/\//] || self.url[/^https:\/\//]
          self.url = "http://#{self.url}"
        end
      end
    end
  end
end
