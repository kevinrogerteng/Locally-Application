LocallyApp::Application.routes.draw do
  resources :trips, :users, :sites, :sessions, :users

  root 'sites#index'
  get '/signout' => 'sessions#destroy', via: :delete
  get'signin' => 'sessions#new'
  get '/signup' => 'users#new', as: :signup
  

end
