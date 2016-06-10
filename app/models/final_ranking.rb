class FinalRanking < ActiveRecord::Base
  belongs_to :fantasy_player

  validates :fantasy_player, presence: true
  validates :year, presence: true

  validates_numericality_of :rank, less_than_or_equal_to: 8
  validates_numericality_of :rank, greater_than_or_equal_to: 0

  def self.select_final_ranking_columns
    select("final_rankings.id, final_rankings.rank, final_rankings.winnings,
           final_rankings.points, final_rankings.year")
  end

  def self.select_sum_points_and_winnings
    select("SUM(final_rankings.points) as points,
           SUM(final_rankings.winnings) as winnings")
  end
end
