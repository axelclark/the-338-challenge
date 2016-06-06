require "rails_helper"

describe TransactionLineItem do
  it { should belong_to(:fantasy_team) }
  it { should belong_to(:fantasy_player) }
  it { should belong_to(:roster_transaction) }

  it { should define_enum_for(:action) }

  it { should validate_presence_of(:roster_transaction) }
  it { should validate_presence_of(:fantasy_player) }
  it { should validate_presence_of(:fantasy_team) }

  describe ".action_list" do
    it "returns the enum strings for actions" do
      enum_list = %w(adds drops)

      result = TransactionLineItem.action_list

      expect(result).to eq(enum_list)
    end
  end
end
