class FantasyPlayersController < ApplicationController
  def index
    @fantasy_players = FantasyLeague.
                       right_joins_fantasy_players(fantasy_league_param).
                       group_by(&:sports_league_name)
  end

  private
  
    def fantasy_league_param
      params[:fantasy_league_id] || FantasyLeague::DEFAULT_LEAGUE_ID
    end
end
