require 'rails_helper'

describe RosterPosition do
  # Associations
  it { should belong_to(:fantasy_team) }
  it { should belong_to(:fantasy_player) }
  
  # Validations
  it { should validate_presence_of(:fantasy_team) }
  it { should validate_presence_of(:fantasy_player) }
end
