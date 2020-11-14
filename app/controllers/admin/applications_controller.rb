class Admin::ApplicationsController < Admin::AdminController

  def index
    @scholarship = Scholarship.includes('applications').find(params[:scholarship_id])
    @applications = @scholarship.applications
  end

  def show
    @scholarship = Scholarship.includes('applications').find(params[:scholarship_id])
    @application = @scholarship.applications.find(params[:id])
  end

  def update; end
  def destroy; end

end
