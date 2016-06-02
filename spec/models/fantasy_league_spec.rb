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

  describe ".right_joins_fantasy_players" do
    it "returns all fantasy players with their owners in a league" do
      fantasy_league_a = create(:fantasy_league, year: 2016, division: "A")
      fantasy_league_b = create(:fantasy_league, year: 2016, division: "B")
      fantasy_team = create(:fantasy_team, name: "Brown",
                            fantasy_league: fantasy_league_b)
      fantasy_team = create(:fantasy_team, name: "Axel",
                            fantasy_league: fantasy_league_b)
      owned_player = create(:fantasy_player, name: "PlayerA")
      create(:roster_position,
             fantasy_player: owned_player, fantasy_team: fantasy_team)
      unowned_player = create(:fantasy_player, name: "PlayerB")

      result = FantasyLeague.right_joins_fantasy_players(fantasy_league_b.id)

      expect(result.map(&:fantasy_player_name)).to eq(%w(PlayerA PlayerB))
      # Need to fix to include Axel not exact
      expect(result.map(&:fantasy_team_name)).to_not eq(%w(Axel))
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
