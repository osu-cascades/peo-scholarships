require 'test_helper'

class AdminControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test 'requires user authentication' do
    assert(defines_before_filter?(Admin::AdminController, :authenticate_user!))
  end

  test 'requires an admin user' do
    assert(defines_before_filter?(Admin::AdminController, :restrict_unless_admin))
  end

end
