require 'test_helper'

class ApplicationsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test 'requires user authentication' do
    assert(defines_before_filter?(ApplicationsController, :authenticate_user!))
  end

  test 'redirects requests from unauthenticated sessions' do
    # show
    get scholarship_application_path(scholarship_id: 'fake', id: 'fake')
    assert_redirected_to new_user_session_path
    # new
    get new_scholarship_application_path(scholarship_id: 'fake')
    assert_redirected_to new_user_session_path
    # edit
    get edit_scholarship_application_path(scholarship_id: 'fake', id: 'fake')
    assert_redirected_to new_user_session_path
    # create
    post scholarship_applications_path(scholarship_id: 'fake')
    assert_redirected_to new_user_session_path
    # update
    patch scholarship_application_path(scholarship_id: 'fake', id: 'fake')
    assert_redirected_to new_user_session_path
    put scholarship_application_path(scholarship_id: 'fake', id: 'fake')
    assert_redirected_to new_user_session_path
    # destroy
    delete scholarship_application_path(scholarship_id: 'fake', id: 'fake')
    assert_redirected_to new_user_session_path
    # submit
    patch submit_scholarship_application_path(scholarship_id: 'fake', id: 'fake')
    assert_redirected_to new_user_session_path
  end

  test 'redirects requests for someone else\'s application' do
    applicant = users(:applicant)
    other_persons_application = applications(:third)
    refute_equal applicant, other_persons_application.applicant
    sign_in(applicant)
    # show
    get scholarship_application_path(other_persons_application.scholarship, other_persons_application)
    assert_redirected_to scholarships_path
    # edit
    get edit_scholarship_application_path(other_persons_application.scholarship, other_persons_application)
    assert_redirected_to scholarships_path
    # update
    patch scholarship_application_path(other_persons_application.scholarship, other_persons_application)
    assert_redirected_to scholarships_path
    put scholarship_application_path(other_persons_application.scholarship, other_persons_application)
    assert_redirected_to scholarships_path
    # destroy
    delete scholarship_application_path(other_persons_application.scholarship, other_persons_application)
    assert_redirected_to scholarships_path
    # submit
    patch submit_scholarship_application_path(other_persons_application.scholarship, other_persons_application)
    assert_redirected_to scholarships_path
  end

  test 'redirects requests for unpublished scholarships' do
    application = applications(:first_submitted)
    scholarship = application.scholarship
    scholarship.update(published: false)
    sign_in(application.applicant)
    # show
    get scholarship_application_path(scholarship, application)
    assert_redirected_to scholarships_path
    # new
    get new_scholarship_application_path(scholarship)
    assert_redirected_to scholarships_path
    # edit
    get edit_scholarship_application_path(scholarship, application)
    assert_redirected_to scholarships_path
    # create
    post scholarship_applications_path(scholarship)
    assert_redirected_to scholarships_path
    # update
    patch scholarship_application_path(scholarship, application)
    assert_redirected_to scholarships_path
    put scholarship_application_path(scholarship, application)
    assert_redirected_to scholarships_path
    # destroy
    delete scholarship_application_path(scholarship, application)
    assert_redirected_to scholarships_path
    # submit
    patch submit_scholarship_application_path(scholarship, application)
    assert_redirected_to scholarships_path
  end

  test 'redirects requests for scholarships with application deadlines in the past' do
    application = applications(:late)
    scholarship = application.scholarship
    sign_in(application.applicant)
    # new
    get new_scholarship_application_path(scholarship)
    assert_redirected_to scholarships_path
    # edit
    get edit_scholarship_application_path(scholarship, application)
    assert_redirected_to scholarships_path
    # create
    post scholarship_applications_path(scholarship)
    assert_redirected_to scholarships_path
    # update
    patch scholarship_application_path(scholarship, application)
    assert_redirected_to scholarships_path
    put scholarship_application_path(scholarship, application)
    assert_redirected_to scholarships_path
    # destroy
    delete scholarship_application_path(scholarship, application)
    assert_redirected_to scholarships_path
    # submit
    patch submit_scholarship_application_path(scholarship, application)
    assert_redirected_to scholarships_path
  end

end
