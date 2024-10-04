Rails.application.routes.draw do

  root to: 'pages#home', as: 'home'
  get '/privacy', to: 'pages#privacy', as: 'privacy'

  ##Twilio
  # post '/sms', to: 'twilio#respond'
  
  ##Sessions
  get '/login', to: 'sessions#client_login_form', as: 'client_login_form'
  post '/login', to: 'sessions#client_login'
  delete '/logout', to: 'sessions#logout', as: 'logout'

  ##Clients
  get '/clients/:id', to: 'clients#show', as: 'client'
  get '/clients/:id/edit', to: 'clients#edit', as: 'edit_client'
  patch '/clients/:id', to: 'clients#update'
  patch '/change_password/:id', to: 'clients#change_password', as: 'change_password'

  ##Hypnotists
  get '/hypnotists/:id', to: 'hypnotists#show', as: 'hypnotist'

  ##Release form
  get '/release_form', to: 'pages#release', as: 'release_form'
  post '/release_form', to: 'release_signatures#create', as: 'sign_release'

  ##Credits
  get '/invoices/:id', to: 'credits#show', as: 'invoice'

  ##Appointments
  get '/appointments/new/:id', to: 'appointments#new', as: 'new_appointment'
  get '/appointments/:id', to: 'appointments#show', as: 'appointment'
  post '/appointments', to: 'appointments#create'

end
