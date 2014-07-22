module DealRedemptions
  class Product < ActiveRecord::Base
    has_many :redeem_code

    before_validation :format_url_protocol
    validates :name, presence: true

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
