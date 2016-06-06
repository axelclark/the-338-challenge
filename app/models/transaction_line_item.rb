class TransactionLineItem < ActiveRecord::Base
  belongs_to :roster_transaction
  belongs_to :fantasy_team
  belongs_to :fantasy_player

  validates :roster_transaction, presence: true
  validates :fantasy_player, presence: true
  validates :fantasy_team, presence: true

  enum action: { adds: 1, drops: 2 }

  def self.action_list
    actions.keys
  end
end
