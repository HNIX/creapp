class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.integer :investor_id
      t.integer :client_id
      t.string :state
      t.string :name
      t.integer :price
      t.integer :asset_listing_id
      t.string :type
      t.datetime :started_at
      t.datetime :finished_at

      t.timestamps
    end
    add_index :assets, :investor_id, unique: true
    add_index :assets, :client_id, unique: true
  end
end
