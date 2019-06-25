class UploadsController < ApplicationController
	before_action :authenticate_user!

	def new
		@upload = Upload.new
	end

	def index
		params[:tag] ? @uploads = Upload.tagged_with(params[:tag]).order("created_at desc").paginate(page: params[:page], per_page: 25) : @uploads = Upload.all.order("created_at desc").paginate(page: params[:page], per_page: 25)
		params[:tag] ? @files = ActiveStorage::Attachment.where(record: Upload.tagged_with(params[:tag])).order("created_at desc").paginate(page: params[:page], per_page: 25) : @files = ActiveStorage::Attachment.where(record: Upload.all).order("created_at desc").paginate(page: params[:page], per_page: 25)
		if params[:date_range]
			case params[:date_range]
			when "today"
				@uploads = Upload.where('created_at > ?', 1.days.ago).order("created_at desc").paginate(page: params[:page], per_page: 25)
				@files = ActiveStorage::Attachment.where(record: Upload.where('created_at > ?', 1.days.ago)).order("created_at desc").paginate(page: params[:page], per_page: 25)
			when "7_days"
				@uploads = Upload.where('created_at > ?', 7.days.ago).order("created_at desc").paginate(page: params[:page], per_page: 25)
				@files = ActiveStorage::Attachment.where(record: Upload.where('created_at > ?', 7.days.ago)).order("created_at desc").paginate(page: params[:page], per_page: 25)
			when "30_days"
				@uploads = Upload.where('created_at > ?', 30.days.ago).order("created_at desc").paginate(page: params[:page], per_page: 25)
				@files = ActiveStorage::Attachment.where(record: Upload.where('created_at > ?', 30.days.ago)).order("created_at desc").paginate(page: params[:page], per_page: 25)
			when "last_year"
				@uploads = Upload.where('created_at > ?', 365.days.ago).order("created_at desc").paginate(page: params[:page], per_page: 25)
				@files = ActiveStorage::Attachment.where(record: Upload.where('created_at > ?', 365.days.ago)).order("created_at desc").paginate(page: params[:page], per_page: 25)
			else
				@uploads = Upload.all.order("created_at desc").paginate(page: params[:page], per_page: 25)
				@files = ActiveStorage::Attachment.where(record: Upload.all).order("created_at desc").paginate(page: params[:page], per_page: 25)
			end
		end
		if params[:user]
			user = User.find_by(username: params[:user])
			@uploads = Upload.where(user: user).order("created_at desc").paginate(page: params[:page], per_page: 25)

			# @uploads = User.find_by(username: params[:user]).uploads.order("created_at desc").paginate(page: params[:page], per_page: 25)
			@files = ActiveStorage::Attachment.where(record: Upload.where(user: user)).order("created_at desc").paginate(page: params[:page], per_page: 25)
		end
	end

	def create
		@upload = Upload.new(upload_params)
		if @upload.save
			recent_tags = current_user.recent_tags
			tags = upload_params[:tag_list]
			tags = tags.split(",")
			tags.each do |tag|
				tag = tag.parameterize
				recent_tags.push(tag) unless recent_tags.include?(tag)
				if recent_tags.length > 5
					recent_tags.shift
				end
			end
			current_user.recent_tags = recent_tags
			current_user.save
			redirect_to upload_path(@upload)
			# render json: { success: "Upload was successful!" }
			# flash[:success] = "Upload was successful!"
		else 
			render json: { error: "Error making upload :(" }
			# flash[:error] = "Upload was unsuccessful. Please try again."
		end
	end

	def show
		@upload = Upload.find(params[:id])
		if User.exists?(@upload.user_id)
			@uploaded_by = User.find(@upload.user_id).email
		else
			@uploaded_by = "User deleted"
		end
		@setting = Setting.find(1)
	end

	def update
		@upload = Upload.find(params[:id])
		if @upload.update(upload_params)
			redirect_to upload_path(@upload)
		else
			render "edit"
		end
	end

	def delete_image_attachment
		attachment = ActiveStorage::Attachment.find(params[:id])
		attachment.purge # or use purge_later
		upload = Upload.find(params[:upload_id])
		if (upload.files.length <= 0)
			upload.destroy
		end
		redirect_to uploads_url
	end

	private

	def upload_params
		params.require(:upload).permit(:tag_list, files: []).merge(user: current_user)
	end
end
