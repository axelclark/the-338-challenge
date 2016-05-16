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
    select("fantasy_teams.id, fantasy_teams.name,
      SUM(final_rankings.points) as points,
      SUM(final_rankings.winnings) as winnings").
    group("fantasy_teams.id, fantasy_teams.name").
    order("points DESC NULLS LAST")
  end
  
  def points
    fantasy_players.joins(:final_rankings).sum(:points)
  end
end
