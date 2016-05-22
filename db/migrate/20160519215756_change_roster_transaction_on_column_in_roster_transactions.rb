class ChangeRosterTransactionOnColumnInRosterTransactions < ActiveRecord::Migration
  def up
    change_column :roster_transactions, :roster_transaction_on, :datetime
  end

  def down
    change_column :roster_transactions, :roster_transaction_on, :date
  end
end
