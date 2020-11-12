class Admin::ApplicationsController < Admin::AdminController

  def index
    @scholarship = Scholarship.includes('applications').find(params[:scholarship_id])
    @applications = @scholarship.applications
  end

  def show; end
  def new; end
  def create; end
  def edit; end
  def update; end
  def destroy; end

end
