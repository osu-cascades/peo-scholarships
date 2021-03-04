require 'test_helper'

class ScholarshipsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test 'requires user authentication' do
    assert(defines_before_filter?(ScholarshipsController, :authenticate_user!))
  end

  test 'redirects requests from unauthenticated sessions' do
    # index
    get scholarships_path
    assert_redirected_to new_user_session_path
  end

end
