require 'rails_helper'

describe FantasyPlayer do
  # Associations
  it { should belong_to(:sports_league) }
  
  # Validations
  it { should validate_presence_of(:name) }

  it do
    should validate_numericality_of(:final_ranking).
      is_greater_than_or_equal_to(0)
  end
  
  it do
    should validate_numericality_of(:final_ranking).
      is_less_than_or_equal_to(8)
  end
end

