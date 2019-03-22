class UploadsController < ApplicationController
	def new
	end

	def create
		@upload = Upload.new(upload_params)
		@upload.save
	end

	private

	def upload_params
		params.require(:upload).permit(:file)
	end
end
