require 'application_system_test_case'

class AdminViewsApplicationTest < ApplicationSystemTestCase

  include Devise::Test::IntegrationHelpers

  test 'admin views an application' do
    application = applications(:first_submitted)
    sign_in(users(:admin))
    visit admin_scholarships_path
    click_on '1 application', match: :first
    click_on application.applicant.full_name
    assert_text application.scholarship.name
    assert_text application.applicant.full_name
  end
end
