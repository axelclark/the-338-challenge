class SportsLeaguesController < ApplicationController

    def index
      @sports_leagues = SportsLeague.order(:championship_date)
    end

    def show
      @sports_league = SportsLeague.find(params[:id])
    end
end
