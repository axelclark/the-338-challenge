class RosterTransaction < ActiveRecord::Base
  has_many :fantasy_players, through: :transaction_line_items
  has_many :fantasy_teams, through: :transaction_line_items
  has_many :transaction_line_items, dependent: :destroy
  has_many :transaction_line_item_details

  enum roster_transaction_type: { draft: 1, trade: 2, waiver: 3 } 
end
