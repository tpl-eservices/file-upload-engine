class Admin::SettingsController < ApplicationController
	before_action :authenticate_user!
	before_action :authenticate_admin

	def authenticate_admin
		redirect_to '/', alert: "You are not authorized to access this page." unless current_user.admin?
	end

	def index
		@setting = Setting.find(1)
		@users = User.all.order('email ASC')
	end

	def create
		@setting = Setting.new(setting_params)
		if @setting.save
			redirect_to admin_setting_path(@setting)
		else 
			render json: { error: "Error creating setting :(" }
		end
	end

	def update
		@setting = Setting.find(params[:id])
		if @setting.update(setting_params)
			redirect_to admin_settings_path
		else
			render "edit"
		end
	end

	def toggle_user_admin
		user = User.find(params[:id])
		if user.admin
			user.admin = false
		else
			user.admin = true
		end
		if user.save
			redirect_to admin_settings_path
		else
			render "edit"
		end
	end

	private

	def setting_params
		params.require(:setting).permit(:large_image, :medium_image, :small_image)
	end
end
