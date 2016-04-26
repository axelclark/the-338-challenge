class FantasyTeamsController < ApplicationController
  def index
    @fantasy_teams = FantasyTeam.all
  end

  def show
    @fantasy_team = FantasyTeam.find(params[:id])
    # consider using group by instead of two objects
    @fantasy_players = FantasyTeam.
      joins(:fantasy_players => :sports_league).
      joins("LEFT OUTER JOIN final_rankings 
            ON final_rankings.fantasy_player_id = fantasy_players.id").
      select("fantasy_teams.*, 
             fantasy_players.name as fantasy_player_name, 
             sports_leagues.name as sports_league_name,
             final_rankings.rank").
      where("fantasy_teams.id = ?", params[:id])
  end
end

# Inside Agency
# scope :active, -> { where(state: 'active') }

# Somewhere else
# merge(Agency.active)
