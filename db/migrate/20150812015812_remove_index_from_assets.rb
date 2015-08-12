class RemoveIndexFromAssets < ActiveRecord::Migration
  def change
    remove_index :assets, :client_id
    remove_index :assets, :investor_id
    add_index :assets, :client_id
    add_index :assets, :investor_id
  end
end
