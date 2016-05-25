class SportsLeague < ActiveRecord::Base
  has_many :fantasy_players, dependent: :destroy

  validates :championship_date, presence: true
  validates :name, presence: true
  validates :trade_deadline, presence: true
  validates :waiver_deadline, presence: true

  def self.by_fantasy_players
    includes(:fantasy_players).order("fantasy_players.name")
  end

  def self.select_sports_league_columns
    select("sports_leagues.id, sports_leagues.name AS sports_league_name,
           sports_leagues.championship_date")
  end
end


