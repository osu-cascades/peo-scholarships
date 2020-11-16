require 'application_system_test_case'

class ApplicantRegistersTest < ApplicationSystemTestCase

  include Devise::Test::IntegrationHelpers

  test 'applicant registers and sees the list of scholarships' do
    visit new_user_registration_path
    fill_in 'user_first_name', with: 'Fake'
    fill_in 'user_last_name', with: 'User'
    fill_in 'user_email', with: 'fake@fake.com'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_button 'Register'
    assert_text 'Scholarships'
    assert_text scholarships(:first).name
  end
end
