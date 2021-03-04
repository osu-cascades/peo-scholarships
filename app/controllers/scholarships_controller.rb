class ScholarshipsController < ApplicationController

  def index
    @scholarships = Scholarship.published.order(application_deadline: :desc)
  end

  def show
    @scholarship = Scholarship.published.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to scholarships_path, alert: 'Could not access this scholarship.'
  end

end
