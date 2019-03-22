Rails.application.routes.draw do
	get 'welcome/index'

	resources :uploads

	root 'welcome#index'
end
