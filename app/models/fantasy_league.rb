class FantasyLeague < ActiveRecord::Base
  DEFAULT_LEAGUE_ID = 1

  has_many :fantasy_teams

  validates :year, presence: true
  validates :division, presence: true

  def self.right_joins_fantasy_players(league_id)
    fantasy_team_subquery_by_league(league_id).
      merge(FantasyTeam.all_fantasy_players_with_details).
      order("sports_leagues.championship_date, fantasy_players.name")
  end

  def self.fantasy_team_subquery_by_league(league_id)
    joins("
      INNER JOIN fantasy_teams
        ON fantasy_teams.fantasy_league_id = fantasy_leagues.id
        AND " + ActiveRecord::Base.send(:sanitize_sql_array,
                                        ["fantasy_teams.fantasy_league_id = ?",
                                         league_id]) + "").
      select_fantasy_league_columns
  end

  def self.select_fantasy_league_columns
    select("fantasy_leagues.id, fantasy_leagues.year, fantasy_leagues.division")
  end

  def self.only_league(league)
    where("fantasy_leagues.id = ?", league)
  end

  def name
    [year, "Division", division].join(" ")
  end
end
