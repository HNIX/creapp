class DropCompanies < ActiveRecord::Migration
  def up
    drop_table :companies
  end

  def down
    create_table :companies do |t|
      t.string :name
      t.string :url
      t.string :stock_symbol
      t.text :description

      t.timestamps
    end
  end
end
