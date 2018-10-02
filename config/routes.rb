Rails.application.routes.draw do
  resources :users
  resources :spells, only: [:index, :show]
  resources :items, only: [:index, :show]

  root to: 'application#index'
  post '/login', to: 'users#login'
  post '/logout', to: 'users#logout'

  get '/home', to: 'users#home'
end
