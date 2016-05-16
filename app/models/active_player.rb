class ActivePlayer < ActiveRecord::Base
  belongs_to :fantasy_player
  belongs_to :fantasy_league
  
  validates :fantasy_player, presence: true
  validates :fantasy_league, presence: true

  def self.with_owners
    joins("
      LEFT OUTER JOIN roster_positions 
        ON roster_positions.fantasy_player_id = fantasy_players.id
      INNER JOIN sports_leagues
        ON sports_leagues.id = fantasy_players.sports_league_id
      LEFT OUTER JOIN fantasy_teams
        ON fantasy_teams.id = roster_positions.fantasy_team_id").
    select("fantasy_leagues.id, 
      fantasy_players.id, fantasy_players.name as fantasy_player_name,
      fantasy_teams.id, fantasy_teams.name as fantasy_team_name,
      fantasy_teams.fantasy_league_id as league_id,
      sports_leagues.id, sports_leagues.name as sports_league_name,
      fantasy_teams.id, fantasy_teams.name AS fantasy_team_name")
  end
end
