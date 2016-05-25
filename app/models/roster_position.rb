class RosterPosition < ActiveRecord::Base
  belongs_to :fantasy_player
  belongs_to :fantasy_team

  validates :fantasy_player, presence: true
  validates :fantasy_team, presence: true

  def self.with_teams_and_players
    joins_fantasy_players.joins_fantasy_teams
  end

  def self.joins_fantasy_players
    joins(fantasy_player: :sports_league).
      merge(FantasyPlayer.select_fantasy_player_columns).
      merge(SportsLeague.select_sports_league_columns)
  end

  def self.joins_fantasy_teams
    joins(fantasy_team: :fantasy_league).
      merge(FantasyTeam.select_fantasy_team_columns).
      merge(FantasyLeague.select_fantasy_league_columns)
  end
end
