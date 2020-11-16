class ScholarshipsController < ApplicationController
	def index
		@scholarships = Scholarship.all
	end

	def show
		@scholarship = Scholarship.find(params[:id])
	end

	def edit
		@scholarship = Scholarship.find(params[:id])
	end

	def update
		@scholarship = Scholarship.find(params[:id])
		@scholarship.update(params.require(:scholarship).permit(:name))
		redirect_to @scholarship
	end

	def new
		@scholarship = Scholarship.new
	end

	def create
		@scholarship = Scholarship.new(params.require(:scholarship).permit(:name))
		@scholarship.save
		redirect_to @scholarship
	end

	def destroy
		@scholarship = Scholarship.find(params[:id])
		@scholarship.destroy
		redirect_to scholarships_url
	end
end
