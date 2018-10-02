Rails.application.routes.draw do
  resources :users
  resources :spells, only: [:index, :show]
  resources :items, only: [:index, :show]
  # resources :items_users, only: [:new]

  root to: 'application#index'
  post '/login', to: 'users#login'
  post '/logout', to: 'users#logout'

  get '/home', to: 'users#home'

  get '/buyitem', to: 'items_users#new'
  post '/buyitem', to: 'items_users#create'
end
