require 'test_helper'

class AdminApplicationsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test 'requires user authentication' do
    assert(defines_before_filter?(Admin::ApplicationsController, :authenticate_user!))
  end

  test 'requires an admin user' do
    assert(defines_before_filter?(Admin::ApplicationsController, :restrict_unless_admin))
  end

  test 'redirects requests from unauthenticated sessions' do
    # index
    get admin_scholarship_applications_path(scholarship_id: 'fake')
    assert_redirected_to new_user_session_path
    # show
    get admin_scholarship_application_path(scholarship_id: 'fake', id: 'fake')
    assert_redirected_to new_user_session_path
    # update
    patch admin_scholarship_application_path(scholarship_id: 'fake', id: 'fake')
    assert_redirected_to new_user_session_path
    put admin_scholarship_application_path(scholarship_id: 'fake', id: 'fake')
    assert_redirected_to new_user_session_path
    # destroy
    delete admin_scholarship_application_path(scholarship_id: 'fake', id: 'fake')
    assert_redirected_to new_user_session_path
  end

  test 'redirects requests from applicant users to root url' do
    sign_in users(:applicant)
    # index
    get admin_scholarship_applications_path(scholarship_id: 'fake')
    assert_redirected_to root_url
    # show
    get admin_scholarship_application_path(scholarship_id: 'fake', id: 'fake')
    assert_redirected_to root_url
    # update
    patch admin_scholarship_application_path(scholarship_id: 'fake', id: 'fake')
    assert_redirected_to root_url
    put admin_scholarship_application_path(scholarship_id: 'fake', id: 'fake')
    assert_redirected_to root_url
    # destroy
    delete admin_scholarship_application_path(scholarship_id: 'fake', id: 'fake')
    assert_redirected_to root_url
  end

  test 'redirects requests from member users to root url' do
    sign_in users(:member)
    # index
    get admin_scholarship_applications_path(scholarship_id: 'fake')
    assert_redirected_to root_url
    # show
    get admin_scholarship_application_path(scholarship_id: 'fake', id: 'fake')
    assert_redirected_to root_url
    # update
    patch admin_scholarship_application_path(scholarship_id: 'fake', id: 'fake')
    assert_redirected_to root_url
    put admin_scholarship_application_path(scholarship_id: 'fake', id: 'fake')
    assert_redirected_to root_url
    # destroy
    delete admin_scholarship_application_path(scholarship_id: 'fake', id: 'fake')
    assert_redirected_to root_url
  end

end
