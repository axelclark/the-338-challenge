class RosterPosition < ActiveRecord::Base
  belongs_to :fantasy_player
  belongs_to :fantasy_team

  validates :fantasy_player, presence: true
  validates :fantasy_team, presence: true

  def self.with_teams_and_players
    joins(fantasy_player: :sports_league, fantasy_team: :fantasy_league).
    select("fantasy_leagues.id, fantasy_teams.id, 
           fantasy_teams.name AS fantasy_team_name, fantasy_players.id,
           fantasy_players.name AS fantasy_player_name, sports_leagues.id,
           sports_leagues.name AS sports_league_name, 
           sports_leagues.championship_date")
  end
end
