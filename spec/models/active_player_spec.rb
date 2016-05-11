require 'rails_helper'

describe ActivePlayer do
  # Associations
  it { should belong_to(:fantasy_league) }
  it { should belong_to(:fantasy_player) }
  
  # Validations
  it { should validate_presence_of(:fantasy_league) }
  it { should validate_presence_of(:fantasy_player) }
end
