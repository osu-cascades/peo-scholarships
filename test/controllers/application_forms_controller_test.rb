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

end
