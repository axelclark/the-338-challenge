class RosterPositionsController < ApplicationController
  def index
    @roster_positions = RosterPosition.
                        with_teams_and_players.
                        merge(FantasyLeague.only_league(fantasy_league_param)).
                        order("fantasy_teams.name",
                              "sports_leagues.championship_date").
                        group_by(&:fantasy_team_name)
  end

  private

    def fantasy_league_param
      params[:fantasy_league_id] || FantasyLeague::DEFAULT_LEAGUE_ID
    end
end
