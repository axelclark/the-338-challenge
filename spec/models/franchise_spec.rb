require 'rails_helper'

describe Franchise do
  # Associations
  it { should have_many(:fantasy_teams).dependent(:destroy) }
  it { should have_many(:users) }
  
  # Validations
  it { should validate_presence_of(:name) }
end
