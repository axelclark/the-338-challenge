class RenameTransactionDateInRosterTransactions < ActiveRecord::Migration
  def change
    change_table :roster_transactions do |t|
      t.rename  :transaction_date, :roster_transaction_on
    end
  end
end
