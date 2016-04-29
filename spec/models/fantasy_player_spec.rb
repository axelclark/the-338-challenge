require 'rails_helper'

describe FantasyPlayer do
  # Associations
  it { should belong_to(:sports_league) }
  it { should have_many(:final_rankings) }
  it { should have_many(:roster_positions) }
  
  # Validations
  it { should validate_presence_of(:name) }

  describe "#with_rank" do
    context "with an associated final ranking" do
      it "returns the rank" do
        ranked_sports_team = create(:ranked_fantasy_player)

        result = ranked_sports_team.with_rank

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
end

