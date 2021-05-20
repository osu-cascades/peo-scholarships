require 'application_system_test_case'

class ApplicantCreatesApplicationTest < ApplicationSystemTestCase

  include Devise::Test::IntegrationHelpers

  test 'applicant creates an application' do
    sign_in users(:applicant)
    visit new_scholarship_application_path(scholarships(:third))
    fill_in 'Full name', with: 'First Fake Applicant'
    click_button 'Save Application'
    assert_text 'Application created.'
    assert_text 'First Fake Applicant'
  end

  test 'applicant creates an application with an exceeded question word limit' do
    sign_in users(:applicant)
    visit new_scholarship_application_path(scholarships(:third))
    fill_in 'Fake Question 1 (5 word limit)', with: 'one two three four five six'
    click_button 'Save Application'
    assert_text 'Word limit in one or more questions exceeded.'
  end

  test 'applicant creates an application with external scholarship', js: true do
    sign_in users(:applicant)
    visit new_scholarship_application_path(scholarships(:third))
    click_link 'Add Scholarship/Grant'
    fill_in 'Scholarship/Grant Name', with: 'eop'
    fill_in 'Amount per Month', with: 1000
    click_button 'Save Application'
    assert_text 'Application created.'
  end
end
