class FantasyTeam < ActiveRecord::Base
  has_many :fantasy_players, through: :roster_positions
  has_many :roster_positions, dependent: :destroy
  has_many :roster_transactions, through: :transaction_line_items
  has_many :transaction_line_items
  has_many :transaction_line_item_details

  belongs_to :fantasy_league
  belongs_to :franchise

  def self.select_fantasy_team_columns
    select("fantasy_teams.id, fantasy_teams.name AS fantasy_team_name,
           fantasy_teams.waiver_position")
  end

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
    select_fantasy_team_columns.
    merge(FantasyPlayer.select_fantasy_player_columns).
    merge(FinalRanking.select_final_ranking_columns).
    merge(SportsLeague.select_sports_league_columns).
    order("sports_leagues.name, final_rankings.rank").
    where("final_rankings.rank = 1 OR final_rankings.rank = 2")
  end

  def points
    fantasy_players.joins(:final_rankings).sum(:points)
  end
end
