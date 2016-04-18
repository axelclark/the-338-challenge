class CreateSportsLeagues < ActiveRecord::Migration
  def change
    create_table :sports_leagues do |t|
      t.string :name
      t.date :waiver_deadline
      t.date :trade_deadline
      t.date :championship_date

      t.timestamps null: false
    end
  end
end
