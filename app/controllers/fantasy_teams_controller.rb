class FantasyTeamsController < ApplicationController
  def show
    @fantasy_team = FantasyTeam.find(params[:id])
  end
end
