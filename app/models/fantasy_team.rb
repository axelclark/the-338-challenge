class FantasyTeam < ActiveRecord::Base
  has_many :fantasy_players, through: :roster_positions
  has_many :roster_positions, dependent: :destroy
  belongs_to :fantasy_league
  belongs_to :franchise

  def self.with_points_and_winnings
    joins("
      LEFT OUTER JOIN roster_positions 
        ON roster_positions.fantasy_team_id = fantasy_teams.id
      LEFT OUTER JOIN fantasy_players
        ON fantasy_players.id = roster_positions.fantasy_player_id
      LEFT OUTER JOIN final_rankings 
        ON final_rankings.fantasy_player_id = fantasy_players.id").
    select("fantasy_teams.id, fantasy_teams.name, fantasy_teams.waiver_position,
      SUM(final_rankings.points) as points,
      SUM(final_rankings.winnings) as winnings").
    group("fantasy_teams.id, fantasy_teams.name").
    order("points DESC NULLS LAST")
  end
  
  def self.with_first_and_second_ranked_players
    joins("
      LEFT OUTER JOIN roster_positions 
        ON roster_positions.fantasy_team_id = fantasy_teams.id
      RIGHT OUTER JOIN fantasy_players
        ON fantasy_players.id = roster_positions.fantasy_player_id
      INNER JOIN final_rankings 
        ON final_rankings.fantasy_player_id = fantasy_players.id
      INNER JOIN sports_leagues 
        ON sports_leagues.id = fantasy_players.sports_league_id").
    select("
      fantasy_teams.id, fantasy_teams.name AS fantasy_team_name, 
      fantasy_players.id, fantasy_players.name AS fantasy_player_name, 
      sports_leagues.id, sports_leagues.name AS sports_league_name, 
      sports_leagues.championship_date,
      final_rankings.id, final_rankings.rank, final_rankings.winnings").
    order("sports_leagues.name, final_rankings.rank").
    where("final_rankings.rank = 1 OR final_rankings.rank = 2")
  end
  
  def points
    fantasy_players.joins(:final_rankings).sum(:points)
  end
end
