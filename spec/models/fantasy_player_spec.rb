require 'rails_helper'

describe FantasyPlayer do
  # Associations
  it { should belong_to(:sports_league) }
  it { should have_many(:final_rankings).dependent(:destroy) }
  it { should have_many(:roster_positions).dependent(:destroy) }
  
  # Validations
  it { should validate_presence_of(:name) }

  describe "self.by_name" do
    it "returns fantasy teams sorted by their names" do
      create(:fantasy_player, name: "A")
      create(:fantasy_player, name: "C")
      create(:fantasy_player, name: "B")

      result = FantasyPlayer.by_name.map(&:name)

      expect(result).to eq %w(A B C)
    end
  end

  describe "#with_rank" do
    context "with an associated final ranking" do
      it "returns the rank" do
        fantasy_player = create(:fantasy_player)
        create(:final_ranking, :finished_first, 
               fantasy_player: fantasy_player)

        result = fantasy_player.with_rank

        expect(result).to eq(1)
      end
    end

    context "without an associated final ranking" do
      it "returns '-'" do
        unranked_sports_team = create(:fantasy_player)

        result = unranked_sports_team.with_rank

        expect(result).to eq("-")
      end
    end
  end
  
  describe "#with_points" do
    context "with an associated final ranking" do
      it "returns the points" do
        fantasy_player = create(:fantasy_player)
        create(:final_ranking, :finished_first, 
               fantasy_player: fantasy_player)


        result = fantasy_player.with_points

        expect(result).to eq(8)
      end
    end

    context "without an associated final ranking" do
      it "returns '-'" do
        unranked_sports_team = create(:fantasy_player)

        result = unranked_sports_team.with_points

        expect(result).to eq("-")
      end
    end
  end

  describe "#with_winnings" do
    context "with an associated final ranking" do
      it "returns the winnings" do
        fantasy_player = create(:fantasy_player)
        create(:final_ranking, :finished_first, 
               fantasy_player: fantasy_player)

        result = fantasy_player.with_winnings

        expect(result).to eq(25)
      end
    end

    context "without an associated final ranking" do
      it "returns '-'" do
        unranked_sports_team = create(:fantasy_player)

        result = unranked_sports_team.with_winnings

        expect(result).to eq("-")
      end
    end
  end

  describe "#with_owner" do
    context "with an associated fantasy team" do
      it "returns the owner's name" do
        fantasy_player = create(:fantasy_player)
        fantasy_team = create(:fantasy_team, name: "Brown")
        create(:roster_position, fantasy_player: fantasy_player,
               fantasy_team: fantasy_team)

        result = fantasy_player.with_owner

        expect(result).to eq("Brown")
      end
    end

    context "without an associated fantasy team" do
      it "returns '-'" do
        fantasy_player = create(:fantasy_player)

        result = fantasy_player.with_owner

        expect(result).to eq("-")
      end
    end
  end
end

