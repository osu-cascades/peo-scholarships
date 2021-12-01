require 'application_system_test_case'

class AdminPreviewsApplicationFormTest < ApplicationSystemTestCase

  include Devise::Test::IntegrationHelpers

  test 'admin previews the application form for a scholarship' do
    sign_in(users(:admin))
    scholarship = scholarships(:first)
    visit new_admin_scholarship_application_path(scholarship)
    assert_text 'This is a preview'
  end
end
