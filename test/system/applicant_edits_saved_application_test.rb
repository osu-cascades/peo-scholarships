require 'application_system_test_case'

class ApplicantEditsSavedApplicationTest < ApplicationSystemTestCase

  include Devise::Test::IntegrationHelpers

  test 'applicant edits their saved application' do
    skip # Need to resolve saving application without validating associated awards
    application = applications(:first_submitted)
    sign_in(application.applicant)
    visit edit_scholarship_application_path(application.scholarship, application)
    fill_in 'Address', with: 'New Fake address'
    click_on 'Save Application'
    assert_text 'Application updated'
  end

end
