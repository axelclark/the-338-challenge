require 'rails_helper'

describe FantasyPlayer do
  # Associations
  it { should belong_to(:sports_league) }
  it { should have_many(:final_rankings) }
  it { should have_many(:roster_positions) }
  
  # Validations
  it { should validate_presence_of(:name) }
end

