class ScholarshipsController < ApplicationController
	def index
		@scholarships = Scholarship.all
	end
end
