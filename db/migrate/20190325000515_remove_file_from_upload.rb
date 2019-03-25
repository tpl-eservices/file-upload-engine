class RemoveFileFromUpload < ActiveRecord::Migration[5.2]
	def change
		remove_column :uploads, :file, :string
	end
end
