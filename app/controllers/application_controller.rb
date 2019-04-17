class ApplicationController < ActionController::Base
	before_action :set_tags

	def set_tags
		@tags = ActsAsTaggableOn::Tag.most_used(10)
	end
end
