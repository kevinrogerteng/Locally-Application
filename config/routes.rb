LocallyApp::Application.routes.draw do
  resources :users, :sites, :trips, :sessions

  root 'sites#index'

  get '/signout' => 'sessions#destroy', via: :delete

  get'signin' => 'sessions#new'

  get '/signup' => 'users#new', as: :signup

  post '/trips/:id/activities' => 'activities#create', as: :activities

  get '/trips/:id/activities/new' => 'activities#new', as: :new_activity

  get '/trips/:id/activities/:activity_id' => 'activities#show', as: :activity




end
