require 'marital_status'

class ApplicationsController < ApplicationController

  def show
    @scholarship = Scholarship.find(params[:scholarship_id])
    @application = Application.find(params[:id])
  end

  def new
    @scholarship = Scholarship.find(params[:scholarship_id])
    @application = Application.new(applicant: current_user, scholarship: @scholarship)
    @options_for_marital_status = MaritalStatus::STATUSES.map { |s| [s, s] }
  end

  def create
    @scholarship = Scholarship.find(params[:scholarship_id])
    @application = Application.new(application_params)
    @application.applicant = current_user
    @application.scholarship = @scholarship
    if @application.save
      redirect_to scholarship_application_path(@scholarship, @application), notice: 'Application created.'
    else
      @options_for_marital_status = MaritalStatus::STATUSES.map { |s| [s, s] }
      render :new
    end
  end

  def edit
    @scholarship = Scholarship.find(params[:scholarship_id])
    @application = Application.find(params[:id])
    @options_for_marital_status = MaritalStatus::STATUSES.map { |s| [s, s] }
  end

  def update
    @scholarship = Scholarship.find(params[:scholarship_id])
    @application = Application.find(params[:id])
    if @application.update(application_params)
      redirect_to scholarship_application_path(@scholarship, @application), notice: 'Application updated.'
    else
      @options_for_marital_status = MaritalStatus::STATUSES.map { |s| [s, s] }
      render :edit
    end
  end

  def destroy
    application = Application.find(params[:id])
    application.destroy
    if application.destroyed?
      redirect_to scholarships_url, notice: 'Application deleted.'
    else
      redirect_to scholarships_url, alert: 'Could not delete application.'
    end
  end

  private

  def application_params
    params.require(:application).permit(:name, :dob, :email, :address,
      :phone_number, :ages_of_children, :marital_status, :student_id, :ssn,
      :previous_college1_name, :previous_college1_years, :previous_college1_degree,
      :previous_college2_name, :previous_college2_years, :previous_college2_degree,
      :high_school_name, :high_school_graduation_year)
  end

end
