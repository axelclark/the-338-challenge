Rails.application.routes.draw do

  namespace :admin do
    resources :fantasy_players
    resources :final_rankings
    resources :fantasy_teams
    resources :roster_positions
    resources :sports_leagues
    root to: "fantasy_players#index"
  end

  resources :fantasy_teams, only: :index 
  resources :sports_leagues, only: [:index, :show]
  # Also has high voltage routes.

end
