require 'application_system_test_case'

class ApplicantViewsListOfScholarshipsTest < ApplicationSystemTestCase

  include Devise::Test::IntegrationHelpers

  test 'applicant sees published scholarships' do
    sign_in(users(:applicant))
    visit scholarships_path
    assert_text scholarships(:first).name
  end

  test 'applicant does not see unpublished scholarships' do
    sign_in(users(:applicant))
    visit scholarships_path
    assert_text 'Scholarships'
    refute_text scholarships(:unpublished).name
  end

end
