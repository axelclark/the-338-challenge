class FantasyPlayer < ActiveRecord::Base
  has_many :active_players, dependent: :destroy
  has_many :fantasy_leagues, through: :active_players
  has_many :fantasy_teams, through: :roster_positions
  has_many :final_rankings, dependent: :destroy
  has_many :roster_positions, dependent: :destroy
  has_many :roster_transactions, through: :transaction_line_items
  has_many :transaction_line_items
  belongs_to :sports_league
  
  validates :name, presence: true

  def self.by_name
    order(:name)
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
