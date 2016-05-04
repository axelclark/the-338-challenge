class FantasyLeaguesController < ApplicationController
  def index
    @fantasy_leagues = FantasyLeague.all
  end

  def show
    @fantasy_league = FantasyLeague.find(fantasy_league_params)
  end

  private

    def fantasy_league_params
      params[:id]
    end

end
