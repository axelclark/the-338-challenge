class Franchise < ActiveRecord::Base
  has_many :fantasy_teams, dependent: :destroy
  has_many :users
  
  validates :name, presence: true
end
