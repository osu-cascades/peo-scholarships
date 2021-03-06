require 'test_helper'

class AdminScholarshipsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test 'requires user authentication' do
    assert(defines_before_filter?(Admin::ScholarshipsController, :authenticate_user!))
  end

  test 'requires an admin user' do
    assert(defines_before_filter?(Admin::ScholarshipsController, :restrict_unless_admin))
  end

  test 'redirects requests from unauthenticated sessions' do
    # index
    get admin_scholarships_path
    assert_redirected_to new_user_session_path
    # show
    get admin_scholarship_path(id: 'fake')
    assert_redirected_to new_user_session_path
    # new
    get new_admin_scholarship_path
    assert_redirected_to new_user_session_path
    # edit
    get edit_admin_scholarship_path(id: 'fake')
    assert_redirected_to new_user_session_path
    # create
    post admin_scholarships_path
    assert_redirected_to new_user_session_path
    # update
    patch admin_scholarship_path(id: 'fake')
    assert_redirected_to new_user_session_path
    put admin_scholarship_path(id: 'fake')
    assert_redirected_to new_user_session_path
    # publish
    patch publish_admin_scholarship_path(id: 'fake')
    assert_redirected_to new_user_session_path
    # unpublish
    patch unpublish_admin_scholarship_path(id: 'fake')
    assert_redirected_to new_user_session_path
    # destroy
    delete admin_scholarship_path(id: 'fake')
    assert_redirected_to new_user_session_path
  end

  test 'redirects requests from applicant users to root url' do
    sign_in users(:applicant)
    # index
    get admin_scholarships_path
    assert_redirected_to root_url
    # show
    get admin_scholarship_path(id: 'fake')
    assert_redirected_to root_url
    # new
    get new_admin_scholarship_path
    assert_redirected_to root_url
    # edit
    get edit_admin_scholarship_path(id: 'fake')
    assert_redirected_to root_url
    # create
    post admin_scholarships_path
    assert_redirected_to root_url
    # update
    patch admin_scholarship_path(id: 'fake')
    assert_redirected_to root_url
    put admin_scholarship_path(id: 'fake')
    assert_redirected_to root_url
    # publish
    patch publish_admin_scholarship_path(id: 'fake')
    assert_redirected_to root_url
    # unpublish
    patch unpublish_admin_scholarship_path(id: 'fake')
    assert_redirected_to root_url
    # destroy
    delete admin_scholarship_path(id: 'fake')
    assert_redirected_to root_url
  end

  test 'redirects requests from member users to root url' do
    sign_in users(:member)
    # index
    get admin_scholarships_path
    assert_redirected_to root_url
    # show
    get admin_scholarship_path(id: 'fake')
    assert_redirected_to root_url
    # new
    get new_admin_scholarship_path
    assert_redirected_to root_url
    # edit
    get edit_admin_scholarship_path(id: 'fake')
    assert_redirected_to root_url
    # create
    post admin_scholarships_path
    assert_redirected_to root_url
    # update
    patch admin_scholarship_path(id: 'fake')
    assert_redirected_to root_url
    put admin_scholarship_path(id: 'fake')
    assert_redirected_to root_url
    # publish
    patch publish_admin_scholarship_path(id: 'fake')
    assert_redirected_to root_url
    # unpublish
    patch unpublish_admin_scholarship_path(id: 'fake')
    assert_redirected_to root_url
    # destroy
    delete admin_scholarship_path(id: 'fake')
    assert_redirected_to root_url
  end

end
