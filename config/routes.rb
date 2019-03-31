Rails.application.routes.draw do
	get 'welcome/index'

	resources :uploads do
	  member do
	    delete :delete_image_attachment
	  end
	end

	root 'welcome#index'
end
