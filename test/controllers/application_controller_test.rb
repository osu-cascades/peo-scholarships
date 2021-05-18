require 'test_helper'

class ApplicationControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test 'redirects after applicant sign in' do
    skip
    applicant = users(:applicant)
    sign_in(applicant)
    assert_redirected_to scholarships_path
  end

end