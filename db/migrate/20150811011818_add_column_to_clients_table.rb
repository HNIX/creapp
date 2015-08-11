class AddColumnToClientsTable < ActiveRecord::Migration
  def change
    add_column :clients, :company, :string
  end
end
