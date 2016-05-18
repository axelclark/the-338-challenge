class AddWaiverPositionToFantasyTeams < ActiveRecord::Migration
  def change
    add_column :fantasy_teams, :waiver_position, :integer
  end
end
