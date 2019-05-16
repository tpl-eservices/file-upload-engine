Rails.application.routes.draw do
  get 'settings/index'
  devise_for :users, controllers: { registrations: 'users/registrations' }
	get 'welcome/index'

	authenticate :user do
		resources :uploads do
		  member do
		    delete :delete_image_attachment
		  end
		end
		resources :tags
		root 'uploads#new'

		namespace :admin do
			resources :settings, :tags
		end
	end
end
