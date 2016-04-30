require 'rails_helper'

describe FantasyLeague do
  context "validations" do
    # Associations
    it { should have_many(:fantasy_teams) }
    # Validations
    it { should validate_presence_of(:year) }
    it { should validate_presence_of(:division) }
  end

  describe "#name" do
    it "returns the name of the fantasy league" do
      fantasy_league = create(:fantasy_league, year: 2016, division: "A")

      result = fantasy_league.name

      expect(result).to eq ("2016 Division A")
    end
  end
end
