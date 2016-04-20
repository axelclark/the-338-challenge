Rails.application.routes.draw do

  resources :sports_leagues, only: [:index, :show]

end
