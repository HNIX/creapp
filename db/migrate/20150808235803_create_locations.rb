class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :address
      t.float :longitude
      t.float :latitude
      t.references :user, index: true
      t.references :company, index: true
      t.references :asset, index: true

      t.timestamps
    end
  end
end