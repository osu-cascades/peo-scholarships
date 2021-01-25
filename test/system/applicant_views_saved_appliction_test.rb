require 'application_system_test_case'

class ApplicantViewsSavedApplicationTest < ApplicationSystemTestCase

  include Devise::Test::IntegrationHelpers

  test 'applicant views their saved application' do
    application = applications(:first)
    sign_in(application.applicant)
    visit scholarships_path
    click_on 'View Application', match: :first
    assert_text application.to_s
  end

end
