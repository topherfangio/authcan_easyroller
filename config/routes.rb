Rails::Application.routes.draw do |map|
	resources :users
	resource :user_session
end
