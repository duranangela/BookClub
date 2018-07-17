Rails.application.routes.draw do

  root 'welcome#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :authors do
    resources :books, except: [:index]
  end
  resources :books, only: [:index]

  resources :users, only: [:new, :create, :show]
end
