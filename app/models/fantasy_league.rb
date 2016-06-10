class FantasyLeague < ActiveRecord::Base
  DEFAULT_LEAGUE_ID = 1

  has_many :fantasy_teams

  validates :year, presence: true
  validates :division, presence: true

  def self.only_league(league)
    where("fantasy_leagues.id = ?", league)
  end

  def self.right_joins_fantasy_players(league)
    joins("
      INNER JOIN fantasy_teams
        ON fantasy_teams.fantasy_league_id = fantasy_leagues.id
        AND " + ActiveRecord::Base.send(:sanitize_sql_array,
                                        ["fantasy_teams.fantasy_league_id = ?",
                                         league]) + "
      INNER JOIN roster_positions
        ON roster_positions.fantasy_team_id = fantasy_teams.id
      RIGHT OUTER JOIN fantasy_players
        ON fantasy_players.id = roster_positions.fantasy_player_id").
      merge(FantasyPlayer.with_details).
      select_fantasy_league_columns.
      merge(FantasyTeam.select_fantasy_team_columns).
      merge(FantasyLeague.select_fantasy_league_columns).
      order("sports_leagues.championship_date, fantasy_players.name")
  end

  def self.select_fantasy_league_columns
    select("fantasy_leagues.id, fantasy_leagues.year, fantasy_leagues.division")
  end

  def name
    [year, "Division", division].join(" ")
  end
end
