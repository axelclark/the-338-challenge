class SportsLeague < ActiveRecord::Base

  validates :name, presence: true
  validates :championship_date, presence: true
end
