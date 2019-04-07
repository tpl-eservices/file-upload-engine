class UploadsController < ApplicationController
	def new
		@upload = Upload.new
	end

	def index
		params[:tag] ? @uploads = Upload.tagged_with(params[:tag]).order("created_at desc") : @uploads = Upload.all.order("created_at desc")
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
		params.require(:upload).permit({ files: [] }, :tag_list, :tag, { tag_ids: [] }, :tag_ids).merge(user: current_user)
	end
end
