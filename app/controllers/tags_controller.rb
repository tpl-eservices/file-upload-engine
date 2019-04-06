class TagsController < ApplicationController
	def new
	end

	def create
		@tag = Tag.new(tag_params)
		@tag.save
		redirect_to tags_url
	end

	private

	def tag_params
		params.require(:tag).permit(:name)
	end
end
