Rails.application.routes.draw do

  root 'welcome#index'

  resources :authors do
    resources :books, except: [:index]
  end
  resources :books, only: [:index]

  resources :users, only: [:new]
end
