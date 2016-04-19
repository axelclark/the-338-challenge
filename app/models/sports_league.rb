class SportsLeague < ActiveRecord::Base
  has_many :fantasy_players

  validates :name, presence: true
  validates :championship_date, presence: true 
end
