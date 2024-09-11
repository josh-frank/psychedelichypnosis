Rails.application.routes.draw do

  root to: 'pages#home', as: 'home'
  
  ##Sessions
  get '/login', to: 'sessions#client_login_form', as: 'client_login_form'
  post '/login', to: 'sessions#client_login'
  delete '/', to: 'sessions#logout', as: 'logout'

  ##Clients
  get '/clients/:id', to: 'clients#show', as: 'client'

  ##Release form
  get '/release_form', to: 'pages#release', as: 'release_form'
  post '/release_form', to: 'release_signatures#create', as: 'sign_release'

  ##Credits
  get '/invoice/:id', to: 'credits#show', as: 'invoice'

end
