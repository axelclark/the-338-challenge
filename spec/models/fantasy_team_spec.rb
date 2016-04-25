require 'rails_helper'

describe FantasyTeam do
  it { should have_many(:roster_positions) }
end
