require 'rails_helper'

describe RosterPosition do
  # Associations
  it { should belong_to(:fantasy_team) }
  it { should belong_to(:fantasy_player) }

  # Validations
  it { should validate_presence_of(:fantasy_team) }
  it { should validate_presence_of(:fantasy_player) }

  describe ".with_teams_and_players" do
    it "returns details for fantasy players and fantasy teams" do
      sports_league = create(:sports_league, name: "A")
      fantasy_player = create(
        :fantasy_player, name: "B", sports_league: sports_league)
      fantasy_team = create(:fantasy_team, name: "C")
      create(:roster_position, fantasy_player: fantasy_player,
        fantasy_team: fantasy_team)

      result = RosterPosition.with_teams_and_players

      expect(result.map(&:sports_league_name)).to eq %w(A)
      expect(result.map(&:fantasy_player_name)).to eq %w(B)
      expect(result.map(&:fantasy_team_name)).to eq %w(C)
    end
  end

  describe ".joins_fantasy_players" do
    it "joins fantasy players and details" do
      skip
    end
  end

  describe ".joins_fantasy_teams" do
    it "joins fantasy teams and details" do
      skip
    end
  end

  describe ".left_joins_fantasy_players" do
    it "joins fantasy players and ALL roster positions" do
      skip
    end
  end

  describe ".right_joins_fantasy_players" do
    it "joins ALL fantasy players" do
      skip
    end
  end

  describe ".select_roster_position_columns" do
    it "selects all relevant columns" do
      skip
    end
  end
end
