class RosterTransactionsController < ApplicationController
  def index
    @roster_transactions = RosterTransaction.
                           joins(fantasy_teams: :fantasy_league).
                           merge(FantasyLeague.only_league(league_param)).
                           distinct
  end

  private

  def league_param
    params[:fantasy_league_id] || FantasyLeague::DEFAULT_LEAGUE_ID
  end
end
