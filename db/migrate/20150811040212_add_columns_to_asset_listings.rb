class AddColumnsToAssetListings < ActiveRecord::Migration
  def change
    add_column :asset_listings, :delivery_date, :date
    add_column :asset_listings, :visibility, :string
    add_column :asset_listings, :ended, :boolean
  end
end
