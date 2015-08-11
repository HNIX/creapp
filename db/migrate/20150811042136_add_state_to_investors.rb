class AddStateToInvestors < ActiveRecord::Migration
  def change
    add_column :investors, :state, :string
  end
end
