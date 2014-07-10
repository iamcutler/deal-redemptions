class CreateDealRedemptionsCompanies < ActiveRecord::Migration
  def change
    create_table :deal_redemptions_companies do |t|
      t.string :name, null: false
      t.text :description
      t.string :url
      t.string :slug, null: false

      t.timestamps
    end
  end
end
