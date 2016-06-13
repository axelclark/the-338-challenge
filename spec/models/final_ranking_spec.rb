require 'rails_helper'

describe FinalRanking do
  it { should belong_to(:fantasy_player) }

  # Validations
  it { should validate_presence_of(:year) }
  it { should validate_presence_of(:fantasy_player) }

  it do
    should validate_numericality_of(:rank).
      is_greater_than_or_equal_to(0)
  end

  it do
    should validate_numericality_of(:rank).
      is_less_than_or_equal_to(8)
  end

  describe ".select_sum_points_and_winnings" do
    it "sums all points and winnings" do
      create(:final_ranking, points: 8, winnings: 25)
      create(:final_ranking, points: 5, winnings: 10)

      result = FinalRanking.select_sum_points_and_winnings

      expect(result.map(&:points)).to eq [13]
      expect(result.map(&:winnings)).to eq [35]
    end
  end

  describe ".select_final_ranking_columns" do
    it "sums all points and winnings" do
      create(:final_ranking, points: 8, winnings: 25)

      result = FinalRanking.select_sum_points_and_winnings

      expect(result.map(&:points)).to eq [8]
      expect(result.map(&:winnings)).to eq [25]
    end
  end
end
