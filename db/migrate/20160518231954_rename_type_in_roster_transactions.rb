class RenameTypeInRosterTransactions < ActiveRecord::Migration
  def change
    change_table :roster_transactions do |t|
      t.rename :type, :roster_transaction_type
    end
  end
end
