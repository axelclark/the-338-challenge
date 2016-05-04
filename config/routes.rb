Rails.application.routes.draw do

  root to: "fantasy_leagues#index"

  namespace :admin do
    resources :fantasy_players
    resources :final_rankings
    resources :fantasy_teams
    resources :fantasy_leagues
    resources :roster_positions
    resources :sports_leagues
    root to: "fantasy_players#index"
  end

  resources :fantasy_teams, only: :show
  resources :fantasy_leagues, only: :show 
  resources :sports_leagues, only: [:index, :show]
  # Also has high voltage routes.

end
