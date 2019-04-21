Rails.application.routes.draw do
  devise_for :users
	get 'welcome/index'

	get 'my_uploads', to: 'uploads#my_uploads'
	resources :uploads do
	  member do
	    delete :delete_image_attachment
	  end
	end
	resources :tags

	root 'uploads#new'
end
