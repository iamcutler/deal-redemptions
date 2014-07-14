class CreateDealRedemptionsTransactions < ActiveRecord::Migration
  def change
    create_table :deal_redemptions_transactions do |t|
      t.belongs_to :company, index: true

      t.timestamps
    end
  end
end
