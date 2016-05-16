class SportsLeague < ActiveRecord::Base
  has_many :fantasy_players, dependent: :destroy

  validates :championship_date, presence: true 
  validates :name, presence: true
  validates :trade_deadline, presence: true 
  validates :waiver_deadline, presence: true 

  def self.by_fantasy_players
    includes(:fantasy_players).order("fantasy_players.name")
  end


end


