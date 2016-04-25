class RosterPosition < ActiveRecord::Base
  belongs_to :fantasy_player
  belongs_to :fantasy_team

  validates :fantasy_player, presence: true
  validates :fantasy_team, presence: true
end
