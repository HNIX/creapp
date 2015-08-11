class AddRankingToInvestors < ActiveRecord::Migration
  def change
    add_column :investors, :qualified, :boolean
    add_column :investors, :modified_rank_score, :float
    add_column :investors, :rank_score, :integer
  end
end
