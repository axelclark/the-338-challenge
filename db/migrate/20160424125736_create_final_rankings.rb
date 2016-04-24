class CreateFinalRankings < ActiveRecord::Migration
  def change
    create_table :final_rankings do |t|
      t.references :fantasy_player, index: true, foreign_key: true
      t.integer :year
      t.integer :rank

      t.timestamps null: false
    end
  end
end
