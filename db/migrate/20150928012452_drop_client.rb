class DropClient < ActiveRecord::Migration
  def up
    drop_table :clients
  end

  def down
    create_table :clients do |t|
      t.references :user, index: true
      t.string :name
      t.string :subdomain
      t.string :url
      t.text :description

      t.timestamps
    end
  end
end
