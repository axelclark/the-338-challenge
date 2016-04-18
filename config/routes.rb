Rails.application.routes.draw do

  root "application#hello"

  resources :sports_leagues, only: [:index, :show]

end
