class FantasyPlayer < ActiveRecord::Base
  belongs_to :sports_league
  has_many :final_rankings
  has_many :roster_positions
  has_many :fantasy_teams, through: :roster_positions
  
  validates :name, presence: true
end
