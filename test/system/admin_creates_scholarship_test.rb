require 'application_system_test_case'

class AdminCreatesScholarshipTest < ApplicationSystemTestCase

  include Devise::Test::IntegrationHelpers

  test 'admin creates a scholarship' do
    sign_in users(:admin)
    visit new_admin_scholarship_path
    fill_in 'Name', with: 'Fake New Scholarship'
    fill_in 'Application deadline', with: 10.days.from_now.to_date.to_s
    click_button 'Create Scholarship'
    assert_text 'Scholarship created'
    assert_text 'Fake New Scholarship'
  end

  test 'admin tries to create an invalid scholarship' do
    sign_in users(:admin)
    visit new_admin_scholarship_path
    click_button 'Create Scholarship'
    assert_text 'error'
    assert_text "Name can't be blank"
    assert_text "Application deadline can't be blank"
  end

  test 'admin tries to create a scholarship with a deadline in the past' do
    sign_in users(:admin)
    visit new_admin_scholarship_path
    fill_in 'Name', with: 'Fake New Scholarship'
    fill_in 'Application deadline', with: Date.yesterday.to_date.to_s
    click_button 'Create Scholarship'
    assert_text 'error'
    assert_text "Application deadline can't be in the past"
  end

end
