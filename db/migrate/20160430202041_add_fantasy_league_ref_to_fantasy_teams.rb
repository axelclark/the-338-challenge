class AddFantasyLeagueRefToFantasyTeams < ActiveRecord::Migration
  def change
    add_reference :fantasy_teams, :fantasy_league, index: true, foreign_key: true
  end
end
