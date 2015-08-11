class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.references :client, index: true
      t.references :asset_listing, index: true
      t.boolean :sent
      t.boolean :send_now
      t.date :send_on
      t.boolean :step_1_complete
      t.boolean :step_2_complete
      t.boolean :step_3_complete
      t.boolean :step_4_complete
      t.boolean :authorized

      t.timestamps
    end
  end
end
