class CreateDealRedemptionsRedeemCodes < ActiveRecord::Migration
  def change
    create_table :deal_redemptions_redeem_codes do |t|
      t.belongs_to :company, index: true
      t.belongs_to :product, index: true
      t.belongs_to :redemption, index: true
      t.string :code
      t.integer :status, default: 1

      t.timestamps
    end
  end
end
