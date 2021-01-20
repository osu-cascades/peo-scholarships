require 'application_system_test_case'

class ApplicantDeletesSavedApplicationTest < ApplicationSystemTestCase

  include Devise::Test::IntegrationHelpers

  test 'applicant deletes their saved application' do
    sign_in(users(:applicant))
    application = applications(:first)
    visit scholarship_application_path(application.scholarship, application)
    click_on 'Delete'
    assert_text 'Application deleted'
  end
end
