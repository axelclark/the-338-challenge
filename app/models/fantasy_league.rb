class FantasyLeague < ActiveRecord::Base

  has_many :fantasy_teams

  validates :year, presence: true
  validates :division, presence: true 

  def name
    [year, "Division", division].join(" ")
  end
end
