LocallyApp::Application.routes.draw do
  resources :users, :sites, :trips, :sessions

  root 'sites#index'

  delete '/signout' => 'sessions#destroy', via: :delete

  get'signin' => 'sessions#new', as: :signin

  get '/signup' => 'users#new', as: :signup

  post '/trips/:id/activities' => 'activities#create', as: :activities

  post '/trips/:id/add_activity' => 'activities#add_activity', as: :add_activity

  get '/trips/:id/activities/new' => 'activities#new', as: :new_activity

  get '/trips/:id/activities/:activity_id' => 'activities#show', as: :activity

  get '/trips/:id/activities/:activity_id/edit' => 'activities#edit', as: :edit_activity

  patch '/trips/:id/activities/:activity_id' => 'activities#update'

  delete '/trips/:id/activities/:activity_id' => 'activities#destroy', as: :delete
end
