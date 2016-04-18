class SportsLeaguesController < ApplicationController

    def index
      @sports_leagues = SportsLeague.all
    end

end
