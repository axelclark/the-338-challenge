class FantasyLeague < ActiveRecord::Base

  has_many :active_players, dependent: :destroy
  has_many :fantasy_players, through: :active_players
  has_many :fantasy_teams

  validates :year, presence: true
  validates :division, presence: true 
  
  
  def self.right_joins_fantasy_players(league)
    joins("
      INNER JOIN fantasy_teams 
        ON fantasy_teams.fantasy_league_id = fantasy_leagues.id
        AND " + ActiveRecord::Base.send(:sanitize_sql_array, 
          ["fantasy_teams.fantasy_league_id = ?", league]) + "
      INNER JOIN roster_positions 
        ON roster_positions.fantasy_team_id = fantasy_teams.id 
      RIGHT OUTER JOIN fantasy_players 
        ON fantasy_players.id = roster_positions.fantasy_player_id
      INNER JOIN sports_leagues 
        ON sports_leagues.id = fantasy_players.sports_league_id").
    select("
      fantasy_leagues.id, fantasy_teams.id, 
      fantasy_teams.name AS fantasy_team_name, fantasy_players.id,
      fantasy_players.name AS fantasy_player_name, sports_leagues.id,
      sports_leagues.name AS sports_league_name, 
      sports_leagues.championship_date").
    order("sports_leagues.championship_date, fantasy_players.name")
  end

  def name
    [year, "Division", division].join(" ")
  end
end
