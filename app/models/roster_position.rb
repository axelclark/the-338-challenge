class RosterPosition < ActiveRecord::Base
  belongs_to :fantasy_player
  belongs_to :fantasy_team

  validates :fantasy_player, presence: true
  validates :fantasy_team, presence: true

  # scope :with_players, -> { joins(fantasy_player: :sports_league) }
  # scope :with_teams, -> { joins(fantasy_team: :fantasy_league) }


  def self.with_teams_and_players
    joins(fantasy_player: :sports_league, fantasy_team: :fantasy_league).
    select("fantasy_leagues.id, fantasy_teams.id, 
           fantasy_teams.name AS fantasy_team_name, fantasy_players.id,
           fantasy_players.name AS fantasy_player_name, sports_leagues.id,
           sports_leagues.name AS sports_league_name, 
           sports_leagues.championship_date")
  end

  def self.only_league(league)
    where("fantasy_leagues.id = ?", league)
  end
end

# SELECT fantasy_leagues.id, 
#        fantasy_teams.id, fantasy_teams.name AS fantasy_team_name, 
#        fantasy_players.id, fantasy_players.name AS fantasy_player_name, 
#        sports_leagues.id, sports_leagues.name AS sports_leagues_name 
# FROM "roster_positions" 
# INNER JOIN "fantasy_players" 
#   ON "fantasy_players"."id" = "roster_positions"."fantasy_player_id" 
# INNER JOIN "sports_leagues" 
#   ON "sports_leagues"."id" = "fantasy_players"."sports_league_id" 
# INNER JOIN "fantasy_teams" 
#   ON "fantasy_teams"."id" = "roster_positions"."fantasy_team_id" 
# INNER JOIN "fantasy_leagues" 
#   ON "fantasy_leagues"."id" = "fantasy_teams"."fantasy_league_id" 
# WHERE (fantasy_leagues.id = 1)
