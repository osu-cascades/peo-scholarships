class ScholarshipsController < ApplicationController

  def index
    @scholarships = Scholarship.published.order(application_deadline: :desc)
  end

end
