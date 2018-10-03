Rails.application.routes.draw do
  resources :users, only: [:index, :new, :create, :show, :edit, :update]
  resources :spells, only: [:index, :show]
  resources :items, only: [:index, :show]
  resources :possessions, only: [:new, :create]
  resources :castings, only: [:create]

  root to: 'application#index'

  get '/home', to: 'users#home'
  get "/signup", to: "users#new", as: "signup"

  get "/login", to: "sessions#new", as: "login"
  post "/sessions", to: "sessions#create", as: "sessions"
  delete "/sessions", to: "sessions#destroy", as: "logout"

  get '/buyitem', to: 'possessions#new'
  patch '/discard_one', to: 'possessions#discard_one'
  patch '/discard_all', to: 'possessions#discard_all'

  get '/castspell', to: 'castings#new'
end
