require "rails_helper"

describe RosterTransaction do
  it { should have_many(:transaction_line_items).dependent(:destroy) }
  it { should have_many(:fantasy_players).through(:transaction_line_items) }
  it { should have_many(:fantasy_teams).through(:transaction_line_items) }
  it { should define_enum_for(:roster_transaction_type) }

  describe ".type_list" do
    it "returns the enum strings for roster transaction types" do
    enum_list = ["Initial draft", "Mid season draft", "Waiver claim", "Trade"]

    result = RosterTransaction.type_list

    expect(result).to eq(enum_list)
    end
  end

  describe ".ordered_by_transaction_date" do
    it "returns the roster transactions by descending date" do
    create(:roster_transaction, roster_transaction_on: "2016-05-17")
    create(:roster_transaction, roster_transaction_on: "2016-05-16")

    result = RosterTransaction.ordered_by_transaction_date

    expect(result.map(&:roster_transaction_on)).to eq(%w(2016-05-17 2016-05-16))
    end
  end
end
