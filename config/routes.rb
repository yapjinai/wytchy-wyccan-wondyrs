Rails.application.routes.draw do
  resources :users
  resources :spells, only: [:index, :show]
  resources :items, only: [:index, :show]
  resources :possessions, only: [:index, :create]

  root to: 'application#index'
  post '/login', to: 'users#login'
  post '/logout', to: 'users#logout'

  get '/logout', to: 'users#logout'

  get '/home', to: 'users#home'

  # get '/login', to: 'sessions#new', as 'login'
  # post '/login', to: 'sessions#create', as 'login'
  # rails g controller Sessions
  # def new
  #   render :new
  # end
  # def create
  #   # find out of we have a user with this username
  #   # get that user record from db
  #   # authenticate that user
  # end

end
