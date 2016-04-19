class AddSportsLeagueRefToFantasyPlayer < ActiveRecord::Migration
  def change
    add_reference :fantasy_players, :sports_league, index: true, foreign_key: true
  end
end
