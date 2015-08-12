class CreateAssetMessages < ActiveRecord::Migration
  def change
    create_table :asset_messages do |t|
      t.integer :asset_id
      t.boolean :sender_is_client
      t.text :content

      t.timestamps
    end
    add_index :asset_messages, :asset_id
  end
end
