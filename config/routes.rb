Rails::Application.routes.draw do |map|
  resources :authorizations
	resources :users

  match '/login', :controller => 'sessions', :action => 'new'
  match 'logout', :controller => 'sessions', :action => 'destroy'

  match '/auth/:provider/callback', :to => 'sessions#create'
end
