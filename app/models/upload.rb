class Upload < ApplicationRecord
	has_many_attached :files
	belongs_to :user
	has_many :taggings
	has_many :tags, through: :taggings
end
