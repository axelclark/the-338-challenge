class TransactionLineItem < ActiveRecord::Base
  belongs_to :roster_transaction
  belongs_to :fantasy_team
  belongs_to :fantasy_player

  validates :roster_transaction, presence: true
  validates :fantasy_player, presence: true
  validates :fantasy_team, presence: true
  
  enum action: { add: 1, drop: 2 } 
end