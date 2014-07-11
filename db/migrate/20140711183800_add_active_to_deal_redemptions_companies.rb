class AddActiveToDealRedemptionsCompanies < ActiveRecord::Migration
  def change
    add_column :deal_redemptions_companies, :active, :integer, default: 1
  end
end
