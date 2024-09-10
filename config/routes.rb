Rails.application.routes.draw do

  root to: 'pages#home', as: 'home'
  
  ##Sessions
  get '/login', to: 'sessions#login_form', as: 'login_form'
  post '/login', to: 'sessions#login'
  delete '/', to: 'sessions#logout', as: 'logout'
  
  ##Users
  get '/users/:id', to: 'users#show', as: 'user'

  ##Release form
  get '/release_form', to: 'pages#release', as: 'release_form'
  post '/release_form', to: 'release_signatures#create', as: 'sign_release'

end
