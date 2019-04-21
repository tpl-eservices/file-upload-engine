class UploadsController < ApplicationController
	def new
		@upload = Upload.new
	end

	def index
		params[:tag] ? @uploads = Upload.tagged_with(params[:tag]).order("created_at desc") : @uploads = Upload.all.order("created_at desc")
		if params[:date_range]
			case params[:date_range]
			when "30_days"
				@uploads = Upload.where('created_at > ?', 30.days.ago).order("created_at desc")
			when "last_year"
				@uploads = Upload.where('created_at > ?', 365.days.ago).order("created_at desc")
			else
				@uploads = Upload.all.order("created_at desc")
			end
		end
	end

	def create
		@upload = Upload.new(upload_params)
		if @upload.save
			redirect_to uploads_url
			# render json: { success: "Upload was successful!" }
			# flash[:success] = "Upload was successful!"
		else 
			render json: { error: "Error making upload :(" }
			# flash[:error] = "Upload was unsuccessful. Please try again."
		end
		
	end

	def show
		@upload = Upload.find(params[:id])
		@uploaded_by = User.find(@upload.user_id).email
	end

	def delete_image_attachment
		attachment = ActiveStorage::Attachment.find(params[:id])
		attachment.purge # or use purge_later
		redirect_to uploads_url
	end

	private

	def upload_params
		params.require(:upload).permit(:tag_list, files: []).merge(user: current_user)
	end
end
