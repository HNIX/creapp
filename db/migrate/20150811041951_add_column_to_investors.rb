class AddColumnToInvestors < ActiveRecord::Migration
  def change
    add_column :investors, :visibility, :string
  end
end
