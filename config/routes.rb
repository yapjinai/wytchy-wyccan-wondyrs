Rails.application.routes.draw do
  resources :users

  root to: 'application#index'
  get '/login', to: 'users#login'
  post '/login', to: 'users#authenticate'

  get '/home', to: 'users#home'
end
