class FantasyPlayersController < ApplicationController
  def index
    @fantasy_players = FantasyLeague.
      right_joins_fantasy_players(params_fantasy_league).
      group_by(&:sports_league_name)
  end

  private
  
    def params_fantasy_league
      params_fantasy_league = params[:fantasy_league_id] || 1
    end
end
