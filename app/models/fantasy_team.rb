class FantasyTeam < ActiveRecord::Base
  has_many :fantasy_players, through: :roster_positions
  has_many :roster_positions, dependent: :destroy
  has_many :roster_transactions, through: :transaction_line_items
  has_many :transaction_line_items
  has_many :transaction_line_item_details

  belongs_to :fantasy_league
  belongs_to :franchise

  def self.with_points_and_winnings
    left_joins_fantasy_players_with_details.
      select_fantasy_team_columns.
      merge(FinalRanking.select_sum_points_and_winnings).
      group("fantasy_teams.id, fantasy_teams.name").
      order("points DESC NULLS LAST")
  end

  def self.with_first_and_second_ranked_players
    all_fantasy_players_with_details.
      where("final_rankings.rank = 1 OR final_rankings.rank = 2").
      order("sports_leagues.name, final_rankings.rank")
  end

  def self.all_fantasy_players_with_details
    left_joins_roster_positions.
      merge(RosterPosition.right_joins_fantasy_players.
            select_roster_position_columns).
      merge(FantasyPlayer.with_all_details).
      select_fantasy_team_columns
  end

  def self.left_joins_fantasy_players_with_details
    left_joins_roster_positions.
      merge(RosterPosition.left_joins_fantasy_players).
      merge(FantasyPlayer.left_join_all_details)
  end

  def self.left_joins_roster_positions
    joins("LEFT OUTER JOIN roster_positions
      ON roster_positions.fantasy_team_id = fantasy_teams.id")
  end

  def self.select_fantasy_team_columns
    select("fantasy_teams.id, fantasy_teams.name AS fantasy_team_name,
           fantasy_teams.waiver_position")
  end

  def points
    fantasy_players.joins(:final_rankings).sum(:points)
  end
end
