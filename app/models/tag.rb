class Tag < ApplicationRecord
	has_many :taggings
	has_many :uploads, through: :taggings
end
