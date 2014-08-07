require 'csv'

module DealRedemptions
  module Admin
    class Importer
      def initialize(company = nil, product = nil)
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

      def export_redemptions_csv(redemptions)
        @redeem_codes = []

        CSV.generate({ skip_blanks: true }) do |csv|
          csv << ["id", 'first_name', 'last_name', 'email', 'phone', 'address', 'address2', 'city', 'state', 'zip_code', 'country', 'redemption_codes', 'comments', 'created_at']
          redemptions.each do |item|
            # Loop redemption codes used
            item.redeem_code.each do |code|
              @redeem_codes.push code.code
            end

            csv << [
              item.id,
              item.first_name,
              item.last_name,
              item.email_address,
              item.phone,
              item.address1,
              item.address2,
              item.city,
              item.state,
              item.zip_code,
              item.country,
              @redeem_codes.join(', '),
              item.comments,
              item.created_at
            ]
          end
        end .html_safe
      end
    end
  end
end