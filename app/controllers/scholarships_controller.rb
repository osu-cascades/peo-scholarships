class ScholarshipsController < ApplicationController

  def index
    @scholarships = Scholarship.all
  end

  def show
    @scholarship = Scholarship.find(params[:id])
  end

end
