module ApplicationHelper
	def formatted_date(date)
		date.to_formatted_s(:long) 
	end
end