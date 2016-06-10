class FantasyPlayer < ActiveRecord::Base
  has_many :fantasy_teams, through: :roster_positions
  has_many :final_rankings, dependent: :destroy
  has_many :roster_positions, dependent: :destroy
  has_many :roster_transactions, through: :transaction_line_items
  has_many :transaction_line_items
  has_many :transaction_line_item_details
  belongs_to :sports_league

  validates :name, presence: true

  def self.with_details
    with_final_rankings.with_sports_league.select_fantasy_player_columns
  end

  def self.with_final_rankings
    joins("LEFT OUTER JOIN final_rankings
      ON final_rankings.fantasy_player_id = fantasy_players.id").
      merge(FinalRanking.select_final_ranking_columns)
  end

  def self.with_sports_league
    joins("LEFT OUTER JOIN sports_leagues
        ON sports_leagues.id = fantasy_players.sports_league_id").
      merge(SportsLeague.select_sports_league_columns)
  end

  def self.by_name
    order(:name)
  end

  def self.select_fantasy_player_columns
    select("fantasy_players.id, fantasy_players.name AS fantasy_player_name")
  end

  def with_rank
    unless final_rankings.empty?
      final_rankings.last.rank
    else
      '-'
    end
  end

  def with_points
    unless final_rankings.empty?
      final_rankings.last.points
    else
      '-'
    end
  end

  def with_winnings
    unless final_rankings.empty?
      final_rankings.last.winnings
    else
      '-'
    end
  end

  def with_owner
    unless fantasy_teams.empty?
      fantasy_teams.last.name
    else
      '-'
    end
  end
end
