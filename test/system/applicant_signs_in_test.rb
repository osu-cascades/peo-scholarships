require 'application_system_test_case'

class ApplicantSignsInTest < ApplicationSystemTestCase

  include Devise::Test::IntegrationHelpers

  test 'applicant signs in and sees the list of scholarships' do
    visit new_user_session_path
    fill_in 'user_email', with: users(:guest).email
    fill_in 'user_password', with: 'password'
    click_button 'Sign in'
    assert_text 'Scholarships'
    assert_text scholarships(:first).name
  end
end
