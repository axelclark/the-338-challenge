class FantasyTeam < ActiveRecord::Base
  has_many :roster_positions
  has_many :fantasy_players, through: :roster_positions

  belongs_to :fantasy_league

  def points
    fantasy_players.joins(:final_rankings).sum(:points)
  end

  def self.with_points_and_winnings
    joins(:fantasy_players => :final_rankings).
    select("fantasy_teams.id, fantasy_teams.name,
           SUM(final_rankings.points) as points,
           SUM(final_rankings.winnings) as winnings").
    group("fantasy_teams.id, fantasy_teams.name").
    order("points DESC")
  end
end
