class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.references :client, index: true
      t.string :name
      t.text :description
      t.integer :size
      t.integer :land_size
      t.float :price
      t.float :price_psf
      t.boolean :hide_price
      t.float :cap_rate
      t.float :occupancy
      t.text :highlights
      t.string :year_built

      t.timestamps
    end
  end
end
