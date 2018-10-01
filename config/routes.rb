Rails.application.routes.draw do
  resources :users

  root to: 'application#index'
  post '/login', to: 'users#login'
  post '/logout', to: 'users#logout'

  get '/home', to: 'users#home'
end
