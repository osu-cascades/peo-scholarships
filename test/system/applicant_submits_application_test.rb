require 'application_system_test_case'

class ApplicantSubmitsApplicationTest < ApplicationSystemTestCase

  include Devise::Test::IntegrationHelpers

  test 'applicant submits an application' do
    application = applications(:second_unsubmitted)
    sign_in application.applicant
    visit scholarship_application_path(application.scholarship, application)
    click_on 'Submit'
    assert_text 'Application Submitted.'
  end

  test 'applicant can not submit an incomplete application' do
    application = applications(:second_unsubmitted)
    sign_in application.applicant
    visit edit_scholarship_application_path(application.scholarship, application)
    fill_in 'Full name', with: ''
    click_button 'Save Application'
    click_on 'Submit'
    assert_text 'prohibited this application from being saved'
  end

  test 'applicant can not submit an application with an exceeded word limit' do
    application = applications(:second_unsubmitted)
    sign_in application.applicant
    visit edit_scholarship_application_path(application.scholarship, application)
    fill_in 'Fake Question 2 (5 word limit)', with: 'one two three four five six'
    click_button 'Save Application'
    click_on 'Submit'
    assert_text 'Could not submit application. Word limit in one or more questions exceeded.'
    assert_text 'Edit'
    assert_text 'Submit'
    assert_text 'Delete'
  end

end
