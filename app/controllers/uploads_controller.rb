class UploadsController < ApplicationController
	def new
	end

	def index
		@uploads = Upload.all.order("created_at desc")
	end

	def create
		@upload = Upload.new(upload_params)
		@upload.save
		redirect_to uploads_url
	end

	def show

	end

	def delete_image_attachment
		attachment = ActiveStorage::Attachment.find(params[:id])
		attachment.purge # or use purge_later
		redirect_to uploads_url
	end

	private

	def upload_params
		params.require(:upload).permit(files: []).merge(user: current_user)
	end
end
