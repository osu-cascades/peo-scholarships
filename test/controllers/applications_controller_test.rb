require 'test_helper'

class ApplicationsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test 'requires user authentication' do
    assert(defines_before_filter?(ApplicationsController, :authenticate_user!))
  end

  test 'redirects requests from unauthenticated sessions' do
    skip
    # index
    get applications_path
    assert_redirected_to new_user_session_path
  end

end
