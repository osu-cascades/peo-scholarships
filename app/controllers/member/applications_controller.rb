require 'marital_status'

class Member::ApplicationsController < Member::MemberController

  def index
    @scholarship = Scholarship.includes('applications').find(params[:scholarship_id])
    @applications = @scholarship.applications.submitted

    respond_to do |format|
      format.html
      format.xlsx
    end
  end

  def show
    @scholarship = Scholarship.includes('applications').find(params[:scholarship_id])
    @application = @scholarship.applications.find(params[:id])
  end

  def update; end

end
