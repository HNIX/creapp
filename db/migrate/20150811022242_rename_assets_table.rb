class RenameAssetsTable < ActiveRecord::Migration
  def change
    rename_table :assets, :asset_listings
  end
end
