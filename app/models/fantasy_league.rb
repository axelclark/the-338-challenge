class FantasyLeague < ActiveRecord::Base
  DEFAULT_LEAGUE_ID = 1

  has_many :fantasy_teams

  validates :year, presence: true
  validates :division, presence: true

  def self.only_league(league)
    where("fantasy_leagues.id = ?", league)
  end

  def self.right_joins_fantasy_players(league)
    fantasy_team_subquery_by_league(league).
      merge(FantasyTeam.all_fantasy_players_with_details).
      order("sports_leagues.championship_date, fantasy_players.name")
  end

  def self.select_fantasy_league_columns
    select("fantasy_leagues.id, fantasy_leagues.year, fantasy_leagues.division")
  end

  def self.fantasy_team_subquery_by_league(league)
    joins("
      INNER JOIN fantasy_teams
        ON fantasy_teams.fantasy_league_id = fantasy_leagues.id
        AND " + ActiveRecord::Base.send(:sanitize_sql_array,
        ["fantasy_teams.fantasy_league_id = ?",league]) + "").
      select_fantasy_league_columns
  end

  def name
    [year, "Division", division].join(" ")
  end
end
