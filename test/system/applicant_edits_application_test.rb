require 'application_system_test_case'

class ApplicantEditsApplicationTest < ApplicationSystemTestCase

  include Devise::Test::IntegrationHelpers

  test 'applicant edits their application' do
    application = applications(:first)
    sign_in(application.applicant)
    visit edit_scholarship_application_path(application.scholarship, application)
    fill_in 'Address', with: 'New Fake address'
    click_on 'Update Application'
    assert_text 'Application updated'
  end

  test 'applicant tries to update invalid application' do
    application = applications(:first)
    sign_in(application.applicant)
    visit edit_scholarship_application_path(application.scholarship, application)
    fill_in 'Address', with: ''
    click_on 'Update Application'
    assert_text 'Edit application'
    assert_text 'error'
  end

end
