require 'test_helper'

class ApplicationFormsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test 'requires user authentication' do
    assert(defines_before_filter?(ApplicationFormsController, :authenticate_user!))
  end

  test 'redirects requests from unauthenticated sessions' do
    # show
    get scholarship_application_form_path(scholarship_id: 'fake', id: 'fake')
    assert_redirected_to new_user_session_path
    # new
    get new_scholarship_application_form_path(scholarship_id: 'fake')
    assert_redirected_to new_user_session_path
    # edit
    get edit_scholarship_application_form_path(scholarship_id: 'fake', id: 'fake')
    assert_redirected_to new_user_session_path
    # create
    post scholarship_applications_path(scholarship_id: 'fake')
    assert_redirected_to new_user_session_path
    # update
    patch scholarship_application_form_path(scholarship_id: 'fake', id: 'fake')
    assert_redirected_to new_user_session_path
    put scholarship_application_form_path(scholarship_id: 'fake', id: 'fake')
    assert_redirected_to new_user_session_path
    # destroy
    delete scholarship_application_form_path(scholarship_id: 'fake', id: 'fake')
    assert_redirected_to new_user_session_path
  end

  test 'redirects requests for someone else\'s application form' do
    applicant = users(:applicant)
    other_persons_application_form = application_forms(:third)
    refute_equal applicant, other_persons_application_form.applicant
    sign_in(applicant)
    # show
    get scholarship_application_form_path(other_persons_application_form.scholarship, other_persons_application_form)
    assert_redirected_to scholarships_path
    # edit
    get edit_scholarship_application_form_path(other_persons_application_form.scholarship, other_persons_application_form)
    assert_redirected_to scholarships_path
    # update
    patch scholarship_application_form_path(other_persons_application_form.scholarship, other_persons_application_form)
    assert_redirected_to scholarships_path
    put scholarship_application_form_path(other_persons_application_form.scholarship, other_persons_application_form)
    assert_redirected_to scholarships_path
    # destroy
    delete scholarship_application_form_path(other_persons_application_form.scholarship, other_persons_application_form)
    assert_redirected_to scholarships_path
  end

end
