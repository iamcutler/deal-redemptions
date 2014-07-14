class CreateDealRedemptionsRedemptions < ActiveRecord::Migration
  def change
    create_table :deal_redemptions_redemptions do |t|
      t.belongs_to :transaction, index: true
      t.string :first_name,     null: false
      t.string :last_name,      null: false
      t.string :email_address,  null: false
      t.string :phone
      t.string :address1,       null: false
      t.string :address2
      t.string :state,          null: false
      t.string :zip_code,       null: false
      t.string :country,        null: false, default: 'USA'
      t.text :commments

      t.timestamps
    end
  end
end
