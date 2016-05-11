class ActivePlayer < ActiveRecord::Base
  belongs_to :fantasy_player
  belongs_to :fantasy_league
  
  validates :fantasy_player, presence: true
  validates :fantasy_league, presence: true
end
