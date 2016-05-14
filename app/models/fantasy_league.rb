class FantasyLeague < ActiveRecord::Base

  has_many :fantasy_teams

  validates :year, presence: true
  validates :division, presence: true 

  def name
    [year, "Division", division].join(" ")
  end
  
  def self.only_league(league)
    where("fantasy_leagues.id = ?", league)
  end
end
