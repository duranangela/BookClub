Rails.application.routes.draw do

  resources :authors
  resources :books, only: [:index]

end
