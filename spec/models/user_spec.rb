require 'rails_helper'

describe User do
  # Associations
  it { should belong_to(:franchise) }
  
  # Validations
  it { should validate_presence_of(:email) }
end
