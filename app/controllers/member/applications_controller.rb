require 'marital_status'

class Member::ApplicationsController < Member::MemberController

  def index
    @scholarship = Scholarship.includes('applications').find(params[:scholarship_id])
    @applications = @scholarship.applications.includes('applicant').submitted.order('users.last_name')

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
