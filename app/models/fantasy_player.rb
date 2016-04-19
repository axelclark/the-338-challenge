class FantasyPlayer < ActiveRecord::Base
  belongs_to :sports_league

  validates :name, presence: true
end
