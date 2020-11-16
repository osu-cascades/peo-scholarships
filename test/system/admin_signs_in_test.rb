require 'application_system_test_case'

class AdminSignsInTest < ApplicationSystemTestCase

  include Devise::Test::IntegrationHelpers

  test 'admin signs in and sees the admin list of scholarships' do
    visit new_user_session_path
    fill_in 'user_email', with: users(:admin).email
    fill_in 'user_password', with: 'password'
    click_button 'Sign in'
    assert_text 'Administration'
    assert_text 'Scholarships'
    assert_text scholarships(:first).name
  end
end
