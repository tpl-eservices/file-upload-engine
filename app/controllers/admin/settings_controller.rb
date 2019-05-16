class Admin::SettingsController < ApplicationController
	before_action :authenticate_user!
	before_action :authenticate_admin

	def authenticate_admin
		redirect_to '/', alert: "You are not authorized to access this page." unless current_user.admin?
	end

	def index
	end
end
