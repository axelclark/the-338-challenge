class AddFinalRankingToFantasyPlayers < ActiveRecord::Migration
  def change
    add_column :fantasy_players, :final_ranking, :integer
  end
end
