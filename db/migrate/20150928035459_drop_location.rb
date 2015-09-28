class DropLocation < ActiveRecord::Migration
  def up
    drop_table :locations
  end

  def down
    create_table :locations do |t|
      t.string :address
      t.float :longitude
      t.float :latitude
      t.references :user, index: true
      t.references :company, index: true
      t.references :asset_listing, index: true

      t.timestamps
    end
  end
end
