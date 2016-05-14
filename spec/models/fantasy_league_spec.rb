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
  
  describe ".only_league(league)" do
    it "returns only one league by league id" do
      fantasy_league_a = create :fantasy_league, division: "A"
      fantasy_league_a_id = fantasy_league_a.id
      create :fantasy_league, division: "B"

      result = FantasyLeague.only_league(fantasy_league_a_id)

      expect(result.map(&:division)).to eq(%w(A))
    end
  end

end
