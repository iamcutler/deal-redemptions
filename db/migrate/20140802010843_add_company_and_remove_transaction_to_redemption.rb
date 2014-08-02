class AddCompanyAndRemoveTransactionToRedemption < ActiveRecord::Migration
  def change
    rename_column :deal_redemptions_redemptions, :transaction_id, :company_id
  end
end
