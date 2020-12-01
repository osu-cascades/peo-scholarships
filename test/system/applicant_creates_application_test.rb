require 'application_system_test_case'

class ApplicantCreatesApplicationTest < ApplicationSystemTestCase

  include Devise::Test::IntegrationHelpers

  test 'applicant creates their application' do
    sign_in(users(:applicant_with_no_applications))
    visit new_scholarship_application_path(scholarships(:first))
    fill_in 'Date of birth', with: '01/01/2000'
    fill_in 'Address', with: 'Fake address'
    fill_in 'Phone number', with: '555-555-5555'
    select 'Single', from: 'Marital status'
    fill_in 'Last 4 digits of SSN', with: '1111'
    fill_in 'Institution', with: 'Fake University'
    fill_in 'Academic Year', with: '2019'
    fill_in 'application[institution_address]', with: '1234 Fake Rd'
    fill_in 'Major/focus', with: 'Fake Major'
    fill_in 'Projected Date of Completion', with: '01/01/2019'
    fill_in 'application[academic_standing]', with: 'Fake Standing'
    fill_in 'application[high_school_gpa]', with: 4.0
    fill_in 'application[career_plan]', with: 'Fake career plan'
    fill_in 'High School Name', with: 'Fake High School'
    fill_in 'Year Graduated', with: '2000'
    click_on 'Create Application'
    assert_text 'Application created'
  end

  test 'applicant tries to submit incomplete application' do
    sign_in(users(:applicant_with_no_applications))
    visit new_scholarship_application_path(scholarships(:first))
    click_on 'Create Application'
    assert_text 'Scholarship Application'
    assert_text 'error'
  end
end
