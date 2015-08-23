class AddRoleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :industry_role, :string
  end
end
