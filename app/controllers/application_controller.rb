class ApplicationController < ActionController::Base
	before_action :set_tags
	before_action :configure_permitted_parameters, if: :devise_controller?

	def set_tags
		@tags = ActsAsTaggableOn::Tag.most_used(10)
		if current_user
			@most_recent_tags = current_user.recent_tags.reverse
		end
	end

	protected

	def configure_permitted_parameters
		added_attrs = [:username, :email, :password, :password_confirmation, :remember_me, :avatar]
		devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
		devise_parameter_sanitizer.permit :account_update, keys: added_attrs
	end
end
