class TransactionLineItem < ActiveRecord::Base
  belongs_to :roster_transaction
  belongs_to :fantasy_team
  belongs_to :fantasy_player
end
