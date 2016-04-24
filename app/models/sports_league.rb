class SportsLeague < ActiveRecord::Base
  has_many :fantasy_players, dependent: :destroy

  validates :name, presence: true
  validates :championship_date, presence: true 

  def self.by_fantasy_players
    includes(:fantasy_players).order("fantasy_players.name")
  end


end


