class CreateDealRedemptionsUsers < ActiveRecord::Migration
  def change
    create_table :deal_redemptions_users do |t|
      t.string :first_name,     null: false
      t.string :last_name,      null: false
      t.string :email,          null: false
      t.string :password_hash,  null: false
      t.string :password_salt,  null: false
      t.datetime :last_login,   default: Time.now

      t.timestamps
    end
  end
end
