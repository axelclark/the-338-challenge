class FantasyTeam < ActiveRecord::Base
  has_many :roster_positions
  has_many :fantasy_players, through: :roster_positions

  belongs_to :fantasy_league
end
