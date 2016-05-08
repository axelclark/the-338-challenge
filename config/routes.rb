Rails.application.routes.draw do

  root to: "fantasy_leagues#index"
  resources :fantasy_teams, only: :show
  resources :fantasy_leagues, only: :show 
  resources :sports_leagues, only: [:index, :show]

  # Also has high voltage routes.

  # Adminstrate routes
  constraints Clearance::Constraints::SignedIn.new { |user| user.admin? } do
    namespace :admin do
      resources :fantasy_players
      resources :final_rankings
      resources :fantasy_teams
      resources :fantasy_leagues
      resources :roster_positions
      resources :sports_leagues
      root to: "fantasy_players#index"
    end
  end
  
  # Clearance routes
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, controller: "clearance/users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
end
