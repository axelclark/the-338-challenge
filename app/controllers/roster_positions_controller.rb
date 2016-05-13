class RosterPositionsController < ApplicationController
  def index
    @roster_positions = RosterPosition.with_teams_and_players.
      only_league(params_fantasy_league).group_by(&:fantasy_team_name)
  end
  
  private
  
    def params_fantasy_league
      params_fantasy_league = params[:fantasy_league_id] || 1
    end
end
