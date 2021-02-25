require 'test_helper'

class TranscriptsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test 'requires user authentication' do
    assert(defines_before_filter?(TranscriptsController, :authenticate_user!))
  end

  test 'redirects requests from unauthenticated sessions' do
    # destroy
    delete scholarship_application_transcript_path(scholarship_id: 'fake', application_id: 'fake', id: 'fake')
    assert_redirected_to new_user_session_path
  end

  test 'redirects requests for someone else\'s application' do
    skip
    applicant = users(:applicant)
    other_persons_application = applications(:third)
    refute_equal applicant, other_persons_application.applicant
    sign_in(applicant)
    # destroy
    delete scholarship_application_transcript_path(other_persons_application.scholarship, other_persons_application, id: 'fake')
    assert_redirected_to scholarships_path
  end

  test 'redirects requests for unpublished scholarships' do
    skip
    application = applications(:first_submitted)
    scholarship = application.scholarship
    scholarship.update(published: false)
    sign_in(application.applicant)
    # destroy
    delete scholarship_application_transcript_path(scholarship, application, id: 'fake')
    assert_redirected_to scholarships_path
  end

  test 'redirects requests for scholarships with application deadlines in the past' do
    skip
    application = applications(:late)
    scholarship = application.scholarship
    sign_in(application.applicant)
    # destroy
    delete scholarship_application_transcript_path(scholarship, application, id: 'fake')
    assert_redirected_to scholarships_path
  end

end
