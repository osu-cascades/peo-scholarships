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

end
