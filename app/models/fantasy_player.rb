class FantasyPlayer < ActiveRecord::Base
  has_many :fantasy_teams, through: :roster_positions
  has_many :final_rankings, dependent: :destroy
  has_many :roster_positions, dependent: :destroy
  has_many :roster_transactions, through: :transaction_line_items
  has_many :transaction_line_items
  has_many :transaction_line_item_details
  belongs_to :sports_league

  validates :name, presence: true

  delegate :name, to: :sports_league, prefix: true

  def self.top_ranked_players
    joins(:final_rankings, :sports_league).
    joins("
      LEFT OUTER JOIN roster_positions
        ON roster_positions.fantasy_player_id = fantasy_players.id
      LEFT OUTER JOIN fantasy_teams
        ON fantasy_teams.id = roster_positions.fantasy_team_id").
      select_fantasy_player_columns.
      merge(FantasyTema.select_fantasy_team_columns).
      merge(FinalRanking.select_final_ranking_columns).
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

  def self.all_teams_by(league)
    joins(fantasy_teams: :fantasy_league).where("fantasy_league_id = ?", league.id)
  end

  def self.fantasy_owners(league)
    fantasy_teams.by_league(league)
  end

  def owned_in_league(league)
    fantasy_teams.by_league(league)
  end

  def points_for_league(league)
    final_rankings.from_year(league.year)
  end

  def self.total_points(fantasy_team)
    joins(:final_rankings).merge(FinalRanking.from_year(fantasy_team.year)).
      sum(:points)
  end

  def self.with_details(year)
    joins(:final_rankings, :sports_league).merge(FinalRanking.from_year(year))
  end
end
