class AddDetailsToFinalRankings < ActiveRecord::Migration
  def change
    add_column :final_rankings, :points, :integer
    add_column :final_rankings, :winnings, :decimal
  end
end
