require 'rails_helper'

RSpec.describe SportsLeague, type: :model do
  context "validations" do
    it "is valid with a name and required dates" do
      league = build(:sports_league)
  
      expect(league).to be_valid
    end
   
    # Associations
    it { should have_many(:fantasy_players) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:championship_date) }
  end
end
