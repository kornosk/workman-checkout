Rails.application.routes.draw do

  	root 'welcome#index'

	# resources :users
	resources :positions

	resources :users do
		resources :working_dates
  		resources :absences
	end

	# resources :working_dates do	
	# 	member do
	# 		get 'create_working'
	# 	end
	# end
	# resources :working_dates do
	# 	member do
	# 		get 'create_working'
	# 	end
	# end

end
