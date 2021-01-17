require 'test_helper'

class ApplicationFormTest < ActiveSupport::TestCase

  test 'belongs to an applicant' do
    assert_respond_to(ApplicationForm.new, :applicant)
  end

  test 'belongs to a scholarship' do
    assert_respond_to(ApplicationForm.new, :scholarship)
  end

  test 'has many answers' do
    assert_respond_to(ApplicationForm.new, :answers)
  end

  test 'personal information attributes' do
    application_form = ApplicationForm.new
    assert_respond_to(application_form, :name)
    assert_respond_to(application_form, :email)
    assert_respond_to(application_form, :dob)
    assert_respond_to(application_form, :address)
    assert_respond_to(application_form, :phone_number)
    assert_respond_to(application_form, :ages_of_children)
    assert_respond_to(application_form, :marital_status)
    assert_respond_to(application_form, :student_id)
    assert_respond_to(application_form, :ssn)
  end

end
