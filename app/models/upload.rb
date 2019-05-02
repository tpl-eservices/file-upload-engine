class Upload < ApplicationRecord
	has_many_attached :files
	belongs_to :user
	acts_as_taggable_on :tags # Alias for acts_as_taggable_on :tags
  	# acts_as_taggable_on :skills, :interests

	# has_many :taggings
	# has_many :tags, through: :taggings

	# def self.tagged_with(name)
	# 	Tag.find_by!(name: name).uploads
	# end

	# def self.tag_counts
	# 	Tag.select('tags.*, count(taggings.tag_id) as count').joins(:taggings).group('taggings.tag_id')
	# end

	# def tag_list
	# 	tags.map(&:name).join(', ')
	# end

	# def tag_list=(names)
	# 	self.tags = names.split(',').map do |n|
	# 		Tag.where(name: n.strip).first_or_create!
	# 	end
	# end

	# validate :validate_tag

	# def validate_tag
	# 	tag_list.each do |tag|
	# 		# This will only accept two character alphanumeric entry such as A1, B2, C3. The alpha character has to precede the numeric.
	# 		errors.add(:tag_list, "Please enter the code in the right format") unless tag =~ /^[A-Z][0-9]$/
	# 	end
	# end
end
