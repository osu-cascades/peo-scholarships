class ScholarshipsController < ApplicationController
	def index
		@scholarships = Scholarship.all
	end

	def show
			@scholarship = Scholarship.find(params[:id])
	end

	def new
		@scholarship = Scholarship.new
	end

	def create
		@scholarship = Scholarship.new(params.require(:scholarship).permit(:name))
		@scholarship.save
		redirect_to scholarships_path
	end
end
