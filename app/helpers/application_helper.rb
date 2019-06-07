module ApplicationHelper
	def formatted_date(date)
		date.to_formatted_s(:long) 
	end

	def tag_object(tag)
		ActsAsTaggableOn::Tag.find_by(name: tag).name
	end
end