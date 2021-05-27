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
    @application = Application.new(applicant: current_user, scholarship: @scholarship)
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
      unless @application.exceeds_word_limits?
        redirect_to scholarship_application_path(@scholarship, @application), notice: 'Application created.'
      else
        redirect_to scholarship_application_path(@scholarship, @application), alert: 'Application created. Word limit in one or more questions exceeded.'
      end
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
    if @application.update_application(current_user)
      unless @application.exceeds_word_limits?
        redirect_to scholarship_application_path(@scholarship, @application), notice: 'Application updated.'
      else
        redirect_to scholarship_application_path(@scholarship, @application), alert: 'Application updated. Word limit in one or more questions exceeded.'
      end
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
    unless @application.exceeds_word_limits?
      @application.submitted = true
    end
    if @application.save
      if @application.submitted
        redirect_to scholarship_application_path(@scholarship, @application), notice: 'Application Submitted.'
      else
        redirect_to scholarship_application_path(@scholarship, @application), alert: 'Could not submit application. Word limit in one or more questions exceeded.'
      end
    else
      @options_for_marital_status = MaritalStatus::STATUSES.map { |s| [s, s] }
      render :edit
    end
  rescue ActiveRecord::RecordNotFound
    redirect_to scholarships_path, alert: 'There was a problem submitting this application.'
  end

  # # See issue 43
  # def recommendation_letter
  #   @scholarship = Scholarship.published.find(params[:scholarship_id])
  #   @application = current_user.applications.find(params[:id])
  #   if @application.recommender_id?
  #     UserMailer.recommendation_letter_email(@application.recommender_id).deliver
  #     redirect_to scholarship_application_path(@scholarship, @application), notice: 'Email sent to recommender.'
  #   else
  #     redirect_to scholarship_application_path(@scholarship, @application), alert: 'There was a problem emailing the recommender.'
  #   end
  # rescue ActiveRecord::RecordNotFound
  #   redirect_to scholarships_path, alert: 'There was a problem accessing this application.'
  # end

  private

  def application_params
    params.require(:application).permit(:name, :dob, :email, :address,
      :phone_number, :ages_of_children, :marital_status, :student_id, :ssn,
      :institution_name, :academic_year, :institution_address, :major, :career_plan,
      :completion_date, :academic_standing, :post_high_school_gpa, :high_school_gpa,
      :previous_college1_name, :previous_college1_years, :previous_college1_degree,
      :previous_college2_name, :previous_college2_years, :previous_college2_degree,
      :high_school_name, :high_school_graduation_year, :total_monthly_income,
      :total_scholarship_monthly,
      :tuition_cost, :supplies, :childcare, :transportation, :other, :monthly_expenses,
      :savings, :investments, :school_loan_debt, :other_debt, :recommender_id,
      :recommendation_letter, transcripts: [],
      answers_attributes: [:id, :question_id, :body],
      awards_attributes: [:id, :name, :date, :description, :_destroy],
      experiences_attributes: [:id, :kind, :title, :started_at, :ended_at, :frequency, :hours_per_week, :total_hours, :responsibilities_accomplishments_honors, :_destroy],
      external_scholarships_attributes: [:id, :name, :amount, :_destroy]
    )
  end

end
