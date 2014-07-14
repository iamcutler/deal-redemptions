class RenameTransactionToRedeemTransaction < ActiveRecord::Migration
  def change
    rename_table :deal_redemptions_transactions, :deal_redemptions_redeem_transactions
  end
end
