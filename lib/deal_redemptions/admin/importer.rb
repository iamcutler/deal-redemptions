require 'csv'

module DealRedemptions
  module Admin
    class Importer
      def initialize(company, product)
        @company = company
        @product = product
      end

      def import_codes_csv(file)
        begin
          CSV.foreach file.path do |row|
            unless row[0].blank?
              code = DealRedemptions::RedeemCode.by_company(@company).find_by_code(row[0])

              unless code
                DealRedemptions::RedeemCode.create(
                  company_id: @company,
                  product_id: @product,
                  code: row[0]
                )
              end
            end
          end

          # Return true after code import
          true
        rescue
          false
        end
      end
    end
  end
end