class CreateActivePlayers < ActiveRecord::Migration
  def change
    create_table :active_players do |t|
      t.references :fantasy_player, index: true, foreign_key: true
      t.references :fantasy_league, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
