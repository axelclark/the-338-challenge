Rails.application.routes.draw do

  namespace :admin do
    resources :fantasy_players
    resources :final_rankings
    resources :sports_leagues
    root to: "fantasy_players#index"
  end

  resources :sports_leagues, only: [:index, :show]
  resources :fantasy_teams, only: :index 
  # Also has high voltage routes.

end
