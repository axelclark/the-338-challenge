class TransactionLineItemDetail < ActiveRecord::Base
  self.primary_key = "transaction_line_item_id"

  belongs_to :roster_transactions
  belongs_to :fantasy_team
  belongs_to :fantasy_player
  
  enum action: { add: 1, drop: 2 } 
end
