class RemoveFinalRankingFromFantasyPlayers < ActiveRecord::Migration
  def change
    remove_column :fantasy_players, :final_ranking, :integer
  end
end
