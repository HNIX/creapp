class CreateInvestors < ActiveRecord::Migration
  def change
    create_table :investors do |t|
      t.references :company, index: true
      t.string :title
      t.string :linked_in
      t.string :fax
      t.integer :price_from
      t.integer :price_to
      t.boolean :verified
      t.boolean :principal
      t.boolean :subscribed
      t.references :user, index: true
      t.string :phone
      t.string :phone_2

      t.timestamps
    end
  end
end
