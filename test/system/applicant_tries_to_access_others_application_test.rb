require 'application_system_test_case'

class ApplicantTriesToAccessOthersApplicationTest < ApplicationSystemTestCase

  include Devise::Test::IntegrationHelpers

  test 'applicant views someone else\'s applicatio' do
    other_persons_application = applications(:third)
    applicant = users(:applicant)
    refute_equal applicant, other_persons_application.applicant
    sign_in(applicant)
    visit scholarship_application_path(other_persons_application.scholarship, other_persons_application)
    refute_text other_persons_application.to_s
    assert_selector 'h1', text: 'Scholarships'
    assert_text 'problem accessing this application'
  end

  test 'applicant edits someone else\'s application' do
    other_persons_application = applications(:third)
    applicant = users(:applicant)
    refute_equal applicant, other_persons_application.applicant
    sign_in(applicant)
    visit edit_scholarship_application_path(other_persons_application.scholarship, other_persons_application)
    refute_text 'Edit application'
    assert_selector 'h1', text: 'Scholarships'
    assert_text 'problem accessing this application'
  end

end
