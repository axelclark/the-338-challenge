require 'rails_helper'

describe FantasyTeam do
  it { should have_many(:fantasy_players).through(:roster_positions) }
  it { should have_many(:roster_positions).dependent(:destroy) }
  it { should have_many(:roster_transactions).through(:transaction_line_items) }
  it { should have_many(:transaction_line_items) }
  it { should belong_to(:fantasy_league) }
  it { should belong_to(:franchise) }
  
  describe ".with_first_and_second_ranked_players" do
    it "returns fantasy players ranked first or second" do
      fantasy_team = create(:fantasy_team, name: "Brown")
      fantasy_player = create(:fantasy_player, name: "PlayerA")
      create(:final_ranking, :finished_first, fantasy_player: fantasy_player)
      create(:roster_position,
             fantasy_player: fantasy_player, fantasy_team: fantasy_team)
      unowned_player = create(:fantasy_player, name: "PlayerB")
      create(:final_ranking, rank: 2, fantasy_player: unowned_player)

      result = FantasyTeam.with_first_and_second_ranked_players

      expect(result.map(&:fantasy_player_name)).to eq(%w(PlayerA PlayerB))
    end
  end
  
  describe "self.with_points_and_winnings" do
    it "returns fantasy teams sorted by their points" do
      fantasy_team = create(:fantasy_team, name: "A")
      other_fantasy_team = create(:fantasy_team, name: "B")
      fantasy_player = create(:fantasy_player)
      create(:final_ranking, :finished_first, 
             points: 8, fantasy_player: fantasy_player)
      create(:roster_position, fantasy_player: fantasy_player, 
             fantasy_team: fantasy_team)

      result = FantasyTeam.with_points_and_winnings.map(&:name)

      expect(result).to eq %w(A B)
    end
  end

  describe "#points" do
    it "returns the total points for a fantasy team" do
      fantasy_player = create(:fantasy_player)
      create(:final_ranking, :finished_first,
             points: 8, fantasy_player: fantasy_player)
      fantasy_team = create(:fantasy_team)
      create(:roster_position, fantasy_player: fantasy_player, 
             fantasy_team: fantasy_team)

      result = fantasy_team.points 

      expect(result).to eq(8) 
    end
  end

end
