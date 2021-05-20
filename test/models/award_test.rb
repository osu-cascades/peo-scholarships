require 'test_helper'

class AwardTest < ActiveSupport::TestCase

  test 'attributes' do
    award = Award.new
    assert_respond_to(award, :name)
    assert_respond_to(award, :description)
    assert_respond_to(award, :date)
  end

  test 'belongs to an application' do
    assert_respond_to(Award.new, :application)
  end

end