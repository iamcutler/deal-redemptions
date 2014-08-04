module DealRedemptions
  module Redemptions
    class Redeem
      def initialize(company)
        @company = company
      end

      def validate_redeem_codes(codes, &block)
        @count = 0

        codes.each do |code|
          unless code.active?
            @count += 1
          end
        end

        block.call @count == 0 ? true : false
      end
    end
  end
end
