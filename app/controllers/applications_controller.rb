class ApplicationsController < ApplicationController
	def index
		@applications = Application.all
	end

	def create
		@application = Application.new(user_id:current_user.id, scholarship_id: scholarship.id)
		render scholarships_path
	end
end
