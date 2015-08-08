class CreateTenants < ActiveRecord::Migration
  def change
    create_table :tenants do |t|
      t.string :name
      t.integer :size
      t.text :description
      t.references :asset, index: true

      t.timestamps
    end
  end
end
