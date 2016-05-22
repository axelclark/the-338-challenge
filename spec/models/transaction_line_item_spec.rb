require "rails_helper"

describe TransactionLineItem do
  it { should belong_to(:fantasy_team) }
  it { should belong_to(:fantasy_player) }
  it { should belong_to(:roster_transaction) }

  it { should define_enum_for(:action) }

  it { should validate_presence_of(:roster_transaction) }
  it { should validate_presence_of(:fantasy_player) }
  it { should validate_presence_of(:fantasy_team) }
end
