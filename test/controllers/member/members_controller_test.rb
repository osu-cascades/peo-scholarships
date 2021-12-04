require 'test_helper'

class MemberControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test 'requires user authentication' do
    assert(defines_before_filter?(Member::MemberController, :authenticate_user!))
  end

  test 'requires an admin user' do
    assert(defines_before_filter?(Member::MemberController, :restrict_unless_member))
  end

end
