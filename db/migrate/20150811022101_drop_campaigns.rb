class DropCampaigns < ActiveRecord::Migration
  def change
    drop_table :campaigns
  end
end
