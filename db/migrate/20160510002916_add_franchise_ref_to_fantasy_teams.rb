class AddFranchiseRefToFantasyTeams < ActiveRecord::Migration
  def change
    add_reference :fantasy_teams, :franchise, index: true, foreign_key: true
  end
end
