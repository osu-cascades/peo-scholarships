require 'application_system_test_case'

class AdminCreatesScholarship < ApplicationSystemTestCase

  include Devise::Test::IntegrationHelpers

  test 'admin creates a scholarship' do
    sign_in(users(:admin))
    visit new_admin_scholarship_path
    fill_in 'Name', with: 'Fake New Scholarship'
    click_button 'Create Scholarship'
    assert_text 'Scholarship created'
    assert_text 'Fake New Scholarship'
  end
end
