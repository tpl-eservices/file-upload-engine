class UploadsController < ApplicationController
	def new
	end

	def create
		render plain: params[:upload].inspect
	end

	private

	def upload_params
		params.require(:upload).permit(tag_ids: [], files: [])
	end
end
