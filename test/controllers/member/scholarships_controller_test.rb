require 'test_helper'

class MemberScholarshipsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test 'requires user authentication' do
    assert(defines_before_filter?(Member::ScholarshipsController, :authenticate_user!))
  end

  test 'requires a member user' do
    assert(defines_before_filter?(Member::ScholarshipsController, :restrict_unless_member))
  end

  test 'redirects requests from unauthenticated sessions' do
    # index
    get member_scholarships_path
    assert_redirected_to new_user_session_path
  end

  test 'redirects requests from applicant users to root url' do
    sign_in users(:applicant)
    # index
    get member_scholarships_path
    assert_redirected_to root_url
  end

end
