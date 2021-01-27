class ScholarshipsController < ApplicationController

  def index
    @scholarships = Scholarship.published
  end

  def show
    @scholarship = Scholarship.published.find(params[:id])
  end

end
