require 'application_system_test_case'

class AdminViewsApplication < ApplicationSystemTestCase

  include Devise::Test::IntegrationHelpers

  test 'admin creates a scholarship' do
    application = applications(:first)
    sign_in(users(:admin))
    visit admin_scholarships_path
    click_on '1 application', match: :first
    click_on application.applicant.full_name
    assert_text application.scholarship.name
    assert_text application.applicant.full_name
  end
end
