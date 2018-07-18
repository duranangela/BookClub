Rails.application.routes.draw do

  root 'welcome#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :authors do
    resources :books, except: [:index]
  end
  resources :books, only: [:index] do
    resources :reviews, except: [:index]
  end

  resources :users, only: [:new, :create, :show] do
    resources :suggestions, except: [:index]
  end

  resources :suggestions, only: [:index]
end
