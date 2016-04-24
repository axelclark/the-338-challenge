require 'rails_helper'

describe SportsLeague do
  context "validations" do
    # Associations
    it { should have_many(:fantasy_players) }

    # Validations
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:championship_date) }

    it "is valid with a name and required dates" do

      league = build(:sports_league)
  
      expect(league).to be_valid
    end
  end 
end
