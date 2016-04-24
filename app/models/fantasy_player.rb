class FantasyPlayer < ActiveRecord::Base
  belongs_to :sports_league
  has_many :final_rankings
  
  validates :name, presence: true
end
