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

end
