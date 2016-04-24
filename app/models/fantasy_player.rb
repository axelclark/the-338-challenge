class FantasyPlayer < ActiveRecord::Base
  belongs_to :sports_league

  validates :name, presence: true
  validates_numericality_of :final_ranking, less_than_or_equal_to: 8
  validates_numericality_of :final_ranking, greater_than_or_equal_to: 0
end
