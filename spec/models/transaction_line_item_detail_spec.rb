require 'rails_helper'

describe TransactionLineItemDetail do
  it { should belong_to(:fantasy_team) }
  it { should belong_to(:fantasy_player) }
  it { should belong_to(:roster_transaction) }
  
  it { should define_enum_for(:action) }
end
