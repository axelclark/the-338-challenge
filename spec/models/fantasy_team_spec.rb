require 'rails_helper'

describe FantasyTeam do
  it { should have_many(:roster_positions) }
  it { should have_many(:fantasy_players).through(:roster_positions) }
  it { should belong_to(:fantasy_league) }
  
  describe "#points" do
    it "returns the total points for a fantasy team" do
      fantasy_player = create(:ranked_fantasy_player)
      fantasy_team = create(:fantasy_team)
      create(:roster_position, fantasy_player: fantasy_player, 
             fantasy_team: fantasy_team)

      result = fantasy_team.points 

      expect(result).to eq(8) 
    end
  end

end
