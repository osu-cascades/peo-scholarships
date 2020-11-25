require 'application_system_test_case'

class ApplicantDeletesApplicationTest < ApplicationSystemTestCase

  include Devise::Test::IntegrationHelpers

  test 'applicant deletes their application' do
    sign_in(users(:applicant))
    application = applications(:first)
    visit scholarship_application_path(application.scholarship, application)
    click_on 'Delete'
    assert_text 'Application deleted'
  end
end
