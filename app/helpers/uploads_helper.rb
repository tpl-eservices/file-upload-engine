module UploadsHelper
	def bytes_to_megabytes(bytes)
	    (bytes.to_f / 1000000).round(2)
	end

	def file_path(file)
		ActiveStorage::Blob.service.send(:path_for, file.key)
	end

	def is_owner(upload)
		if upload.user == current_user
			return true
		end
	end

	def is_image(file)
		if file.content_type == "image/jpeg" || file.content_type == "image/png"
			return true
		end
	end

	def is_video(file)
		if file.content_type == "video/mp4" || file.content_type == "video/mov"
			return true
		end
	end

	def is_pdf(file)
		if file.content_type == "application/pdf"
			return true
		end
	end
end
