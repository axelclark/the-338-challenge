class RosterTransaction < ActiveRecord::Base
  has_many :fantasy_players, through: :transaction_line_items
  has_many :fantasy_teams, through: :transaction_line_items
  has_many :transaction_line_items, dependent: :destroy
  has_many :transaction_line_item_details
  accepts_nested_attributes_for :transaction_line_items, allow_destroy: true

  enum roster_transaction_type: {
    "initial draft" => 1, "mid season draft" => 2, "waiver claim" => 3,
    "trade" => 4
  }

  def self.type_list
    roster_transaction_types.keys
  end

  def self.ordered_by_transaction_date
    order(roster_transaction_on: :desc)
  end
end
