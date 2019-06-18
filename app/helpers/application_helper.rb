module ApplicationHelper
	def formatted_date(date)
		date.to_formatted_s(:long) 
	end

	def tag_object(tag)
		if ActsAsTaggableOn::Tag.find_by(name: tag) && ActsAsTaggableOn::Tag.find_by(name: tag).name
			return ActsAsTaggableOn::Tag.find_by(name: tag).name
		else
			return null
		end
	end
end