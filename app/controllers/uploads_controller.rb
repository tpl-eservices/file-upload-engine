class UploadsController < ApplicationController
	def new
	end

	def index
		@uploads = Upload.all
	end

	def create
		@upload = Upload.new(upload_params)

		puts "******************"
		puts upload_params

		@upload.save
	end

	private

	def upload_params
		params.require(:upload).permit(files: [])
	end
end
