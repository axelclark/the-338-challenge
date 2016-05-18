require 'rails_helper'

describe RosterTransaction do
  it { should have_many(:transaction_line_items).dependent(:destroy) }
  it { should have_many(:fantasy_players).through(:transaction_line_items) }
  it { should have_many(:fantasy_teams).through(:transaction_line_items) }
  it { should define_enum_for(:type) }
end
