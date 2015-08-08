class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :url
      t.string :stock_symbol
      t.text :description

      t.timestamps
    end
  end
end
