class TransactionLineItemDetail < ActiveRecord::Base
  self.primary_key = "transaction_line_item_id"

  belongs_to :roster_transaction
  belongs_to :fantasy_team
  belongs_to :fantasy_player
  
  enum action: { adds: 1, drops: 2 } 
end
