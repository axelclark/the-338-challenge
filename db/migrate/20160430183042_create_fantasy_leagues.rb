class CreateFantasyLeagues < ActiveRecord::Migration
  def change
    create_table :fantasy_leagues do |t|
      t.string :division
      t.integer :year

      t.timestamps null: false
    end
  end
end
