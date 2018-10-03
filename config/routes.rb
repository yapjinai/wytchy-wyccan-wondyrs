Rails.application.routes.draw do
  resources :users, only: [:index, :new, :create, :show, :edit, :update]
  resources :spells, only: [:index, :show]
  resources :items, only: [:index, :show]
  resources :possessions, only: [:index, :create]

  get '/home', to: 'users#home'
  get "signup", to: "users#new", as: "signup"
  get "login", to: "sessions#new", as: "login"
  post "sessions", to: "sessions#create", as: "sessions"
  delete "sessions", to: "sessions#destroy", as: "logout"
  root to: 'application#index'

end
