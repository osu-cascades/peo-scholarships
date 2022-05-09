require 'marital_status'

class Admin::ApplicationsController < Admin::AdminController

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

  def new # Previewing the form
    @scholarship = Scholarship.find(params[:scholarship_id])
    @application = Application.new
    @options_for_marital_status = MaritalStatus::STATUSES.map { |s| [s, s] }
    flash.now[:alert] = "This is a preview of the application form. Finished? Go #{helpers.link_to "back to #{@scholarship}", [:admin, @scholarship]}.".html_safe
  rescue ActiveRecord::RecordNotFound
    redirect_to scholarships_path, alert: 'There was a problem previewing the scholarship application form.'
  end

  def update; end
  def destroy; end

end
