class FantasyLeague < ActiveRecord::Base

  has_many :active_players, dependent: :destroy
  has_many :fantasy_players, through: :active_players
  has_many :fantasy_teams

  validates :year, presence: true
  validates :division, presence: true 

  def name
    [year, "Division", division].join(" ")
  end
end
