class RosterPosition < ActiveRecord::Base
  belongs_to :fantasy_player
  belongs_to :fantasy_team
end
