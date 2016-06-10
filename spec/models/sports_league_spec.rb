require 'rails_helper'

describe SportsLeague do
  context "validations" do
    # Associations
    it { should have_many(:fantasy_players) }

    # Validations
    it { should validate_presence_of(:championship_date) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:trade_deadline) }
    it { should validate_presence_of(:waiver_deadline) }
  end

  describe ".by_fantasy_players" do
    it "preloads fantays players and orders by player name" do
      skip
    end
  end

  describe ".select_sports_league_columns" do
    it "selects all columns and name as sports league name" do
      skip
    end
  end
end
