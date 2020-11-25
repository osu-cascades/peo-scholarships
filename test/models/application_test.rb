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
  end

  test 'is invalid without a name' do
    application = applications(:first)
    assert application.valid?
    application.name = ''
    refute application.valid?
  end

  test 'is invalid without a formatted email address' do
    application = applications(:first)
    assert application.valid?
    application.email = ''
    refute application.valid?
    application.email = 'FAKE'
    refute application.valid?
    application.email = 'fake@fake.com'
    assert application.valid?
  end

  test 'is invalid without a dob' do
    application = applications(:first)
    assert application.valid?
    application.dob = ''
    refute application.valid?
  end

  test 'is invalid without an address' do
    application = applications(:first)
    assert application.valid?
    application.address = ''
    refute application.valid?
  end

  test 'is invalid without a phone number' do
    application = applications(:first)
    assert application.valid?
    application.phone_number = ''
    refute application.valid?
  end

  test 'is invalid without a marital_status' do
    application = applications(:first)
    assert application.valid?
    application.marital_status = ''
    refute application.valid?
  end

  test 'is invalid without a the last four of ssn' do
    application = applications(:first)
    assert application.valid?
    application.ssn = ''
    refute application.valid?
    application.ssn = '1'
    refute application.valid?
    application.ssn = '55555'
    refute application.valid?
    application.ssn = '4444'
    assert application.valid?
  end

  test 'only one application per scholarship per applicant' do
    existing_application = applications(:first)
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
    application = applications(:first)
    applicant_name = application.applicant.full_name
    scholarship_name = application.scholarship.name
    assert_equal "#{scholarship_name} application by #{applicant_name}", application.to_s
  end

  test 'deleting an application deletes all of its answers' do
    application = applications(:first)
    answers = application.answers
    assert application.answers.any?
    application.destroy
    assert application.destroyed?
    assert_empty application.answers
  end

end

