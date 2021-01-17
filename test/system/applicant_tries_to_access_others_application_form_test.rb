require 'application_system_test_case'

class ApplicantTriesToAccessOthersApplicationFormTest < ApplicationSystemTestCase

  include Devise::Test::IntegrationHelpers

  test 'applicant views someone else\'s applicatio' do
    other_persons_application_form = application_forms(:third)
    applicant = users(:applicant)
    refute_equal applicant, other_persons_application_form.applicant
    sign_in(applicant)
    visit scholarship_application_form_path(other_persons_application_form.scholarship, other_persons_application_form)
    refute_text other_persons_application_form.to_s
    assert_selector 'h1', text: 'Scholarships'
    assert_text 'problem accessing this application form'
  end

  test 'applicant edits someone else\'s application' do
    other_persons_application_form = application_forms(:third)
    applicant = users(:applicant)
    refute_equal applicant, other_persons_application_form.applicant
    sign_in(applicant)
    visit edit_scholarship_application_form_path(other_persons_application_form.scholarship, other_persons_application_form)
    refute_text 'Edit application'
    assert_selector 'h1', text: 'Scholarships'
    assert_text 'problem accessing this application form'
  end

end
