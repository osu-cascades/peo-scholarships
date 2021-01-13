class ApplicationFormsController < ApplicationController

  def show
    @scholarship = Scholarship.find(params[:scholarship_id])
    @application_form = ApplicationForm.find(params[:id])
  end

  def new
    @scholarship = Scholarship.find(params[:scholarship_id])
    @application_form = ApplicationForm.new(applicant: current_user, scholarship: @scholarship)
    @options_for_marital_status = MaritalStatus::STATUSES.map { |s| [s, s] }
  end

  def create
    @scholarship = Scholarship.find(params[:scholarship_id])
    @application_form = ApplicationForm.new(application_params)
    @application_form.applicant = current_user
    @application_form.scholarship = @scholarship
    if @application.save
      redirect_to scholarship_application_form_path(@scholarship, @application), notice: 'Application created.'
    else
      @options_for_marital_status = MaritalStatus::STATUSES.map { |s| [s, s] }
      render :new
    end
  end

  def edit
    @scholarship = Scholarship.find(params[:scholarship_id])
    @application_form = ApplicationForm.find(params[:id])
    @options_for_marital_status = MaritalStatus::STATUSES.map { |s| [s, s] }
  end

  def update
    @scholarship = Scholarship.find(params[:scholarship_id])
    @application_form = ApplicationForm.find(params[:id])
    if @application.update(application_params)
      redirect_to scholarship_application_form_path(@scholarship, @application), notice: 'Application updated.'
    else
      @options_for_marital_status = MaritalStatus::STATUSES.map { |s| [s, s] }
      render :edit
    end
  end

  def destroy
    application_form = ApplicationForm.find(params[:id])
    application_form.destroy
    if application_form.destroyed?
      redirect_to scholarships_url, notice: 'Application deleted.'
    else
      redirect_to scholarships_url, alert: 'Could not delete application.'
    end
  end

  private

  def application_params
    params.require(:application).permit(:name, :dob, :email, :address,
      :phone_number, :ages_of_children, :marital_status, :student_id, :ssn)
  end


end
