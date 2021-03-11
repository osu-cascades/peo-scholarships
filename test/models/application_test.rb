require 'test_helper'

class ApplicationTest < ActiveSupport::TestCase

  def valid_application_for(applicant, scholarship)
    Application.new(
      name: 'Fake',
      email: 'fake@example.com',
      dob: '1/1/2000',
      address: 'Fake',
      phone_number: '541-555-5555',
      marital_status: 'single',
      ssn: '5555',
      institution_name: 'Fake Institution',
      academic_year: '2020-21',
      institution_address: "100 Fake Street\nBend, OR\n97703",
      major: 'Fake',
      completion_date: '6/6/2025',
      academic_standing: 'Freshman',
      high_school_gpa: 4.0,
      career_plan: 'Fake',
      high_school_name: 'Fake High School',
      high_school_graduation_year: '2020',
      total_monthly_income: 100,
      total_scholarship_monthly: 100,
      tuition_cost: 100,
      supplies: 100,
      childcare: 100,
      transportation: 100,
      other: 100,
      monthly_expenses: 100,
      savings: 100,
      investments: 100,
      school_loan_debt: 100,
      other_debt: 100,
      applicant: applicant,
      scholarship: scholarship)
  end

  test 'belongs to an applicant' do
    assert_respond_to(Application.new, :applicant)
  end

  test 'belongs to a scholarship' do
    assert_respond_to(Application.new, :scholarship)
  end

  test 'has many answers' do
    assert_respond_to(Application.new, :answers)
  end

  test 'has a recommendation letter' do
    assert_respond_to(Application.new, :recommendation_letter)
  end

  test 'has transcripts' do
    assert_respond_to(Application.new, :transcripts)
  end

  test 'personal information attributes' do
    application = Application.new
    assert_respond_to(application, :name)
    assert_respond_to(application, :email)
    assert_respond_to(application, :dob)
    assert_respond_to(application, :address)
    assert_respond_to(application, :phone_number)
    assert_respond_to(application, :ages_of_children)
    assert_respond_to(application, :marital_status)
    assert_respond_to(application, :student_id)
    assert_respond_to(application, :ssn)
    assert_respond_to(application, :institution_name)
    assert_respond_to(application, :institution_address)
    assert_respond_to(application, :academic_year)
    assert_respond_to(application, :major)
    assert_respond_to(application, :completion_date)
    assert_respond_to(application, :academic_standing)
    assert_respond_to(application, :post_high_school_gpa)
    assert_respond_to(application, :high_school_gpa)
    assert_respond_to(application, :career_plan)
    assert_respond_to(application, :previous_college1_name)
    assert_respond_to(application, :previous_college1_years)
    assert_respond_to(application, :previous_college1_degree)
    assert_respond_to(application, :previous_college2_name)
    assert_respond_to(application, :previous_college2_years)
    assert_respond_to(application, :previous_college2_degree)
    assert_respond_to(application, :high_school_name)
    assert_respond_to(application, :high_school_graduation_year)
    assert_respond_to(application, :total_monthly_income)
    assert_respond_to(application, :total_scholarship_monthly)
    assert_respond_to(application, :scholarship1)
    assert_respond_to(application, :scholarship1_per_month)
    assert_respond_to(application, :scholarship2)
    assert_respond_to(application, :scholarship2_per_month)
    assert_respond_to(application, :scholarship3)
    assert_respond_to(application, :scholarship3_per_month)
    assert_respond_to(application, :tuition_cost)
    assert_respond_to(application, :supplies)
    assert_respond_to(application, :childcare)
    assert_respond_to(application, :transportation)
    assert_respond_to(application, :other)
    assert_respond_to(application, :monthly_expenses)
    assert_respond_to(application, :savings)
    assert_respond_to(application, :investments)
    assert_respond_to(application, :school_loan_debt)
    assert_respond_to(application, :other_debt)

    assert_respond_to(application, :submitted)
  end

  test 'is invalid without a name' do
    application = applications(:first_submitted)
    assert application.valid?
    application.name = ''
    refute application.valid?
  end

  test 'is invalid without a formatted email address' do
    application = applications(:first_submitted)
    assert application.valid?
    application.email = ''
    refute application.valid?
    application.email = 'FAKE'
    refute application.valid?
    application.email = 'fake@fake.com'
    assert application.valid?
  end

  test 'is invalid without a dob' do
    application = applications(:first_submitted)
    assert application.valid?
    application.dob = ''
    refute application.valid?
  end

  test 'is invalid without an address' do
    application = applications(:first_submitted)
    assert application.valid?
    application.address = ''
    refute application.valid?
  end

  test 'is invalid without a phone number' do
    application = applications(:first_submitted)
    assert application.valid?
    application.phone_number = ''
    refute application.valid?
  end

  test 'is invalid without a marital_status' do
    application = applications(:first_submitted)
    assert application.valid?
    application.marital_status = ''
    refute application.valid?
  end

  test 'is invalid without a the last four of ssn' do
    application = applications(:first_submitted)
    assert application.valid?
    application.ssn = ''
    refute application.valid?
    application.ssn = 'Fake'
    refute application.valid?
    application.ssn = '1'
    refute application.valid?
    application.ssn = '55555'
    refute application.valid?
    application.ssn = '4444'
    assert application.valid?
  end

  test 'only one application per scholarship per applicant' do
    existing_application = applications(:first_submitted)
    same_applicant_different_scholarship = valid_application_for(
      existing_application.applicant, Scholarship.new(name: 'Fake'))
    assert same_applicant_different_scholarship.valid?
    same_scholarship_different_applicant = valid_application_for(
      User.new, existing_application.scholarship)
    assert same_scholarship_different_applicant.valid?
    same_applicant_and_scholarship = valid_application_for(
      existing_application.applicant, existing_application.scholarship)
    refute same_applicant_and_scholarship.valid?
  end

  test 'has a string representation including scholarship and applicant name' do
    application = applications(:first_submitted)
    applicant_name = application.applicant.full_name
    scholarship_name = application.scholarship.name
    assert_equal "#{scholarship_name} application by #{applicant_name}", application.to_s
  end

  test 'deleting an application deletes all of its answers' do
    application = applications(:first_submitted)
    answers = application.answers
    assert application.answers.any?
    application.destroy
    assert application.destroyed?
    assert_empty application.answers
  end

  test 'can not be deleted by applicant after being submitted' do
    application = applications(:first_submitted)
    applicant = users(:applicant)
    refute application.delete_application(applicant)
    refute application.destroyed?
  end

  test 'can not be deleted by applicant who does not own it' do
    application = applications(:second_unsubmitted)
    applicant = users(:second_applicant)
    refute application.delete_application(applicant)
    refute application.destroyed?
  end

  test 'can not be deleted by member' do
    application = applications(:second_unsubmitted)
    member = users(:member)
    refute application.delete_application(member)
    refute application.destroyed?
  end

  test 'can be deleted by applicant when unsubmitted' do
    application = applications(:second_unsubmitted)
    applicant = users(:applicant)
    assert application.delete_application(applicant)
    assert application.destroyed?
  end

  test 'can be deleted by admin' do
    application = applications(:first_submitted)
    admin = users(:admin)
    assert application.delete_application(admin)
    assert application.destroyed?
  end

  test 'can not be updated by applicant after being submitted' do
    application = applications(:first_submitted)
    applicant = users(:applicant)
    previous_update = application.updated_at

    application.email = 'updated_fake_email@example.com'
    refute application.update_application(applicant)
    assert_equal application.updated_at, previous_update
  end

  test 'can not be updated by applicant who does not own it' do
    application = applications(:second_unsubmitted)
    applicant = users(:second_applicant)
    previous_update = application.updated_at

    application.email = 'updated_fake_email@example.com'
    refute application.update_application(applicant)
    assert_equal application.updated_at, previous_update
  end

  test 'can not be updated by member' do
    application = applications(:second_unsubmitted)
    member = users(:member)
    previous_update = application.updated_at

    application.email = 'updated_fake_email@example.com'
    refute application.update_application(member)
    assert_equal application.updated_at, previous_update
  end

  test 'can be updated by applicant when unsubmitted' do
    application = applications(:second_unsubmitted)
    applicant = users(:applicant)
    previous_update = application.updated_at

    application.email = 'updated_fake_email@example.com'
    assert application.update_application(applicant)
    refute_equal application.updated_at, previous_update
  end

  test 'can be updated by admin' do
    application = applications(:first_submitted)
    admin = users(:admin)
    previous_update = application.updated_at

    application.email = 'updated_fake_email@example.com'
    assert application.update_application(admin)
    refute_equal application.updated_at, previous_update
  end
end
