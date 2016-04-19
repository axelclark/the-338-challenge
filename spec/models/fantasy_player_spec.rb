require 'rails_helper'

describe FantasyPlayer do
  # Associations
  it { should belong_to(:sports_league) }
  
  # Validations
  it { should validate_presence_of(:name) }
end
