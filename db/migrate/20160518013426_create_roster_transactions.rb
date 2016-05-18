class CreateRosterTransactions < ActiveRecord::Migration
  def change
    create_table :roster_transactions do |t|
      t.integer :type
      t.text :additional_terms
      t.date :transaction_date

      t.timestamps null: false
    end
  end
end
