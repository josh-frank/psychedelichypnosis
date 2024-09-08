Rails.application.routes.draw do

  resources :appointments
  root to: 'pages#home', as: 'home'

  ##Sessions
  get '/login', to: 'sessions#login_form', as: 'login_form'
  post '/login', to: 'sessions#login'
  delete '/', to: 'sessions#logout', as: 'logout'

  ##Users
  get '/users/:id', to: 'users#show', as: 'user'

end
