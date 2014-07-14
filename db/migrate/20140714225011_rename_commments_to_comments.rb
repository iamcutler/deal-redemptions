class RenameCommmentsToComments < ActiveRecord::Migration
  def change
    rename_column :deal_redemptions_redemptions, :commments, :comments
  end
end
