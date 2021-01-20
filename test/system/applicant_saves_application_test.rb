require 'application_system_test_case'

class ApplicantCreatesApplicationTest < ApplicationSystemTestCase

  include Devise::Test::IntegrationHelpers

  test 'applicant saves their application' do
    sign_in(users(:applicant_with_no_applications))
    visit new_scholarship_application_path(scholarships(:first))
    fill_in 'Date of birth', with: '01/01/2000'
    fill_in 'Address', with: 'Fake address'
    fill_in 'Phone number', with: '555-555-5555'
    select 'Single', from: 'Marital status'
    fill_in 'Last 4 digits of SSN', with: '1111'
    click_on 'Save'
    assert_text 'Application created'
  end

end
