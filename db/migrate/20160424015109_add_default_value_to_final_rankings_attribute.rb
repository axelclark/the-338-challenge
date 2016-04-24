class AddDefaultValueToFinalRankingsAttribute < ActiveRecord::Migration
  def up
    change_column :fantasy_players, :final_ranking, :integer, :default => 0
  end

  def down
    change_column :fantasy_players, :final_ranking, :integer, :default => nil
  end
end

