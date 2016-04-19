class CreateFantasyPlayers < ActiveRecord::Migration
  def change
    create_table :fantasy_players do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
