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

  def self.right_joins_fantasy_players
    joins("RIGHT OUTER JOIN fantasy_players
      ON fantasy_players.id = roster_positions.fantasy_player_id")
  end

  def self.left_joins_fantasy_players
    joins("LEFT OUTER JOIN fantasy_players
      ON fantasy_players.id = roster_positions.fantasy_player_id")
  end

  def self.select_roster_position_columns
    select("roster_positions.id")
  end
end
