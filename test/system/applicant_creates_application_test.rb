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
    fill_in 'Last four digits of SSN', with: '1111'
    click_on 'Create Application'
    assert_text 'Application created'
  end

  test 'applicant tries to submit incomplete application' do
    sign_in(users(:applicant_with_no_applications))
    visit new_scholarship_application_path(scholarships(:first))
    click_on 'Create Application'
    assert_text 'Create a new Application'
    assert_text 'error'
  end
end
