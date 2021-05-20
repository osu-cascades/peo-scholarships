require 'test_helper'

class AwardTest < ActiveSupport::TestCase

  test 'belongs to an application' do
    assert_respond_to(Award.new, :application)
  end

end