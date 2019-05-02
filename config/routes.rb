Rails.application.routes.draw do
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
	end
end
