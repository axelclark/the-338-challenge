class CreateTransactionLineItems < ActiveRecord::Migration
  def change
    create_table :transaction_line_items do |t|
      t.references :roster_transaction, index: true, foreign_key: true
      t.references :fantasy_team, index: true, foreign_key: true
      t.references :fantasy_player, index: true, foreign_key: true
      t.integer :action

      t.timestamps null: false
    end
  end
end
