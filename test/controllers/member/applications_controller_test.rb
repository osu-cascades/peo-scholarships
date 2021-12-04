require 'test_helper'

class MemberApplicationsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test 'requires user authentication' do
    assert(defines_before_filter?(Member::ApplicationsController, :authenticate_user!))
  end

  test 'requires a member user' do
    assert(defines_before_filter?(Member::ApplicationsController, :restrict_unless_member))
  end

  test 'redirects requests from unauthenticated sessions' do
    # index
    get member_scholarship_applications_path(scholarship_id: 'fake')
    assert_redirected_to new_user_session_path
    # show
    get member_scholarship_application_path(scholarship_id: 'fake', id: 'fake')
    assert_redirected_to new_user_session_path
    # update
    patch member_scholarship_application_path(scholarship_id: 'fake', id: 'fake')
    assert_redirected_to new_user_session_path
    put member_scholarship_application_path(scholarship_id: 'fake', id: 'fake')
    assert_redirected_to new_user_session_path
  end

  test 'redirects requests from applicant users to root url' do
    sign_in users(:applicant)
    # index
    get member_scholarship_applications_path(scholarship_id: 'fake')
    assert_redirected_to root_url
    # show
    get member_scholarship_application_path(scholarship_id: 'fake', id: 'fake')
    assert_redirected_to root_url
    # update
    patch member_scholarship_application_path(scholarship_id: 'fake', id: 'fake')
    assert_redirected_to root_url
    put member_scholarship_application_path(scholarship_id: 'fake', id: 'fake')
    assert_redirected_to root_url
  end

end
