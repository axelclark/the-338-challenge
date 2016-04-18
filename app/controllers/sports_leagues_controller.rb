class SportsLeaguesController < ApplicationController

    def index
      @sports_leagues = SportsLeague.all
    end

    def show
      @sports_league = SportsLeague.find(params[:id])
    end
end
