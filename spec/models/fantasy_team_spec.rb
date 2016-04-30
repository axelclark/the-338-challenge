require 'rails_helper'

describe FantasyTeam do
  it { should have_many(:roster_positions) }
  it { should have_many(:fantasy_players).through(:roster_positions) }
  it { should belong_to(:fantasy_league) }
end
