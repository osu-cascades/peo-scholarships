require 'test_helper'

class AdminQuestionsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test 'requires user authentication' do
    assert(defines_before_filter?(Admin::QuestionsController, :authenticate_user!))
  end

  test 'requires an admin user' do
    assert(defines_before_filter?(Admin::QuestionsController, :restrict_unless_admin))
  end

  test 'redirects requests from unauthenticated sessions' do
    # index
    get admin_scholarship_questions_path(scholarship_id: 'fake')
    assert_redirected_to new_user_session_path
    # show
    get admin_scholarship_question_path(scholarship_id: 'fake', id: 'fake')
    assert_redirected_to new_user_session_path
    # new
    get new_admin_scholarship_question_path(scholarship_id: 'fake')
    assert_redirected_to new_user_session_path
    # edit
    get edit_admin_scholarship_question_path(scholarship_id: 'fake', id: 'fake')
    assert_redirected_to new_user_session_path
    # create
    post admin_scholarship_questions_path(scholarship_id: 'fake')
    assert_redirected_to new_user_session_path
    # update
    patch admin_scholarship_question_path(scholarship_id: 'fake', id: 'fake')
    assert_redirected_to new_user_session_path
    put admin_scholarship_question_path(scholarship_id: 'fake', id: 'fake')
    assert_redirected_to new_user_session_path
    # destroy
    delete admin_scholarship_question_path(scholarship_id: 'fake', id: 'fake')
    assert_redirected_to new_user_session_path
  end

  test 'redirects requests from guest users to root url' do
    sign_in users(:guest)
    # index
    get admin_scholarship_questions_path(scholarship_id: 'fake')
    assert_redirected_to root_url
    # show
    get admin_scholarship_question_path(scholarship_id: 'fake', id: 'fake')
    assert_redirected_to root_url
    # new
    get new_admin_scholarship_question_path(scholarship_id: 'fake')
    assert_redirected_to root_url
    # edit
    get edit_admin_scholarship_question_path(scholarship_id: 'fake', id: 'fake')
    assert_redirected_to root_url
    # create
    post admin_scholarship_questions_path(scholarship_id: 'fake')
    assert_redirected_to root_url
    # update
    patch admin_scholarship_question_path(scholarship_id: 'fake', id: 'fake')
    assert_redirected_to root_url
    put admin_scholarship_question_path(scholarship_id: 'fake', id: 'fake')
    assert_redirected_to root_url
    # destroy
    delete admin_scholarship_question_path(scholarship_id: 'fake', id: 'fake')
    assert_redirected_to root_url
  end

  test 'redirects requests from member users to root url' do
    sign_in users(:member)
    # index
    get admin_scholarship_questions_path(scholarship_id: 'fake')
    assert_redirected_to root_url
    # show
    get admin_scholarship_question_path(scholarship_id: 'fake', id: 'fake')
    assert_redirected_to root_url
    # new
    get new_admin_scholarship_question_path(scholarship_id: 'fake')
    assert_redirected_to root_url
    # edit
    get edit_admin_scholarship_question_path(scholarship_id: 'fake', id: 'fake')
    assert_redirected_to root_url
    # create
    post admin_scholarship_questions_path(scholarship_id: 'fake')
    assert_redirected_to root_url
    # update
    patch admin_scholarship_question_path(scholarship_id: 'fake', id: 'fake')
    assert_redirected_to root_url
    put admin_scholarship_question_path(scholarship_id: 'fake', id: 'fake')
    assert_redirected_to root_url
    # destroy
    delete admin_scholarship_question_path(scholarship_id: 'fake', id: 'fake')
    assert_redirected_to root_url
  end

end
