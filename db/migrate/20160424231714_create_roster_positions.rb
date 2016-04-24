class CreateRosterPositions < ActiveRecord::Migration
  def change
    create_table :roster_positions do |t|
      t.references :fantasy_player, index: true, foreign_key: true
      t.references :fantasy_team, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
