require 'application_system_test_case'

class ApplicantSavesApplicationTest < ApplicationSystemTestCase

  include Devise::Test::IntegrationHelpers

  test 'applicant saves their application' do
    # Need to resolve saving application without validating associated awards
    sign_in(users(:applicant_with_no_applications))
    visit new_scholarship_application_path(scholarships(:first))
    fill_in 'Date of birth', with: '01/01/2000'
    fill_in 'Address', with: 'Fake address'
    fill_in 'Phone number', with: '555-555-5555'
    select 'Single', from: 'Marital status'
    fill_in 'Last 4 digits of SSN', with: '1111'
    click_on 'Save Application'
    assert_text 'Application created'
  end

end
