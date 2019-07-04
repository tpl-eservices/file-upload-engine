class Upload < ApplicationRecord
	has_many_attached :files
	belongs_to :user
	acts_as_taggable_on :tags
end
