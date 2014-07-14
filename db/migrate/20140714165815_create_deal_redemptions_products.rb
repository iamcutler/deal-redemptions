class CreateDealRedemptionsProducts < ActiveRecord::Migration
  def change
    create_table :deal_redemptions_products do |t|
      t.string :name
      t.string :url

      t.timestamps
    end
  end
end
