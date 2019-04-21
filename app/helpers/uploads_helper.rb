module UploadsHelper
	def bytes_to_megabytes(bytes)
	    (bytes.to_f / 1000000).round(2)
	end

	def file_path(file)
		ActiveStorage::Blob.service.send(:path_for, file.key)
	end
end
