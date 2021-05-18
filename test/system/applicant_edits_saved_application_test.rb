require 'application_system_test_case'

class ApplicantEditsSavedApplicationTest < ApplicationSystemTestCase

  include Devise::Test::IntegrationHelpers

  test 'applicant edits their saved application' do
    application = applications(:second_unsubmitted)
    sign_in application.applicant
    visit edit_scholarship_application_path(application.scholarship, application)
    fill_in 'Address', with: 'New Fake address'
    click_on 'Save Application'
    assert_text 'Application updated'
  end

  test 'applicant can not exceed question word limit on saved application' do
    application = applications(:second_unsubmitted)
    sign_in application.applicant
    visit edit_scholarship_application_path(application.scholarship, application)
    fill_in 'Fake Question 2 (5 word limit)', with: 'one two three four five six'
    click_button 'Save Application'
    assert_text 'Word limit in one or more questions exceeded.'
  end

end
