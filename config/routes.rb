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
			resources :settings do
				member do
				  get :toggle_user_admin
				end
			end
			resources :tags
		end

		devise_scope :user do
			put 'update_avatar', to: 'users/registrations#update_avatar'
		end
	end
end
