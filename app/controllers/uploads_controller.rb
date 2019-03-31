class UploadsController < ApplicationController
	def new
	end

	def index
		@uploads = Upload.all
	end

	def create
		@upload = Upload.new(upload_params)
		@upload.save
	end

	def delete_image_attachment
		# @image = ActiveStorage::Blob.find_signed(params[:id])
		# @image.purge
		attachment = ActiveStorage::Attachment.find(params[:id])
		attachment.purge # or use purge_later
		redirect_to uploads_url
	end

	private

	def upload_params
		params.require(:upload).permit(files: [])
	end
end
