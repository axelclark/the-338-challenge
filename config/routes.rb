Rails.application.routes.draw do

  namespace :admin do
    resources :fantasy_players
    resources :sports_leagues
    root to: "fantasy_players#index"
  end

  resources :sports_leagues, only: [:index, :show]

  # Also has high voltage routes.

end
