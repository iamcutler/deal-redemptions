module DealRedemptions
  class Company < ActiveRecord::Base
    validates :name, :slug, presence: true, uniqueness: true

    private

      def company_params
        # Whitelist permitted parameters
        params.require(:company).permit(:name, :description, :url, :slug, :active)
      end
  end
end
