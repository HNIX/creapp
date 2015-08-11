class AddColumnToAssetListings < ActiveRecord::Migration
  def change
    add_column :asset_listings, :title, :string
  end
end
