class CreateDealRedemptionsMailingLists < ActiveRecord::Migration
  def change
    create_table :deal_redemptions_mailing_lists do |t|
      t.string :first_name
      t.string :last_name
      t.string :email_address, null: false

      t.timestamps
    end
  end
end
