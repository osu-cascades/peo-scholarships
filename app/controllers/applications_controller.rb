require 'marital_status'

class ApplicationsController < ApplicationController

  def show
    @scholarship = Scholarship.published.find(params[:scholarship_id])
    @application = current_user.applications.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to scholarships_path, alert: 'There was a problem accessing this application.'
  end

  def new
    @scholarship = Scholarship.open.find(params[:scholarship_id])
    @application = Application.new(applicant: current_user, scholarship: @scholarship, award: Award.new)
    @application.award.application_id = @application.id
    @options_for_marital_status = MaritalStatus::STATUSES.map { |s| [s, s] }
  rescue ActiveRecord::RecordNotFound
    redirect_to scholarships_path, alert: 'There was a problem starting this application.'
  end

  def create
    @scholarship = Scholarship.open.find(params[:scholarship_id])
    @application = Application.new(application_params)
    @application.applicant = current_user
    @application.scholarship = @scholarship
    if @application.save(validate: false)
      redirect_to scholarship_application_path(@scholarship, @application), notice: 'Application created.'
    else
      @options_for_marital_status = MaritalStatus::STATUSES.map { |s| [s, s] }
      render :new
    end
  rescue ActiveRecord::RecordNotFound
    redirect_to scholarships_path, alert: 'There was a problem saving this application.'
  end

  def edit
    @scholarship = Scholarship.open.find(params[:scholarship_id])
    @application = current_user.applications.find(params[:id])
    @options_for_marital_status = MaritalStatus::STATUSES.map { |s| [s, s] }
  rescue ActiveRecord::RecordNotFound
    redirect_to scholarships_path, alert: 'There was a problem accessing this application.'
  end

  def update
    @scholarship = Scholarship.open.find(params[:scholarship_id])
    @application = current_user.applications.find(params[:id])
    @application.attributes = application_params
    if @application.save(validate: false)
      redirect_to scholarship_application_path(@scholarship, @application), notice: 'Application updated.'
    else
      @options_for_marital_status = MaritalStatus::STATUSES.map { |s| [s, s] }
      render :edit
    end
  rescue ActiveRecord::RecordNotFound
    redirect_to scholarships_path, alert: 'There was a problem saving this application.'
  end

  def destroy
    application = current_user.applications.find(params[:id])
    if application.delete_application(current_user)
      redirect_to scholarships_url, notice: 'Application deleted.'
    else
      redirect_to scholarships_url, alert: 'Could not delete application.'
    end
  rescue ActiveRecord::RecordNotFound
    redirect_to scholarships_path, alert: 'There was a problem deleting this application.'
  end

  def submit
    @scholarship = Scholarship.open.find(params[:scholarship_id])
    @application = current_user.applications.find(params[:id])
    @application.submitted = true
    if @application.save
      redirect_to scholarship_application_path(@scholarship, @application), notice: 'Application Submitted.'
    else
      @options_for_marital_status = MaritalStatus::STATUSES.map { |s| [s, s] }
      render :edit
    end
  rescue ActiveRecord::RecordNotFound
    redirect_to scholarships_path, alert: 'There was a problem submitting this application.'
  end

  private

  def application_params
    params.require(:application).permit(:name, :dob, :email, :address,
      :phone_number, :ages_of_children, :marital_status, :student_id, :ssn,
      :institution_name, :academic_year, :institution_address, :major, :career_plan,
      :completion_date, :academic_standing, :post_high_school_gpa, :high_school_gpa,
      :previous_college1_name, :previous_college1_years, :previous_college1_degree,
      :previous_college2_name, :previous_college2_years, :previous_college2_degree,
      :high_school_name, :high_school_graduation_year, :total_monthly_income,
      :total_scholarship_monthly, :scholarship1, :scholarship1_per_month,
      :scholarship2, :scholarship2_per_month,  :scholarship3, :scholarship3_per_month,
      :tuition_cost, :supplies, :childcare, :transportation, :other, :monthly_expenses,
      :savings, :investments, :school_loan_debt, :other_debt, :recommendation_letter, transcripts: [],
      answers_attributes: [:id, :question_id, :body],
      award_attributes: [:id, :name, :awarded_date, :description])
  end

end
