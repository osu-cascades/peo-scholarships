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

end
