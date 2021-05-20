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

  test 'award has a string representation' do
    award = awards(:first_submitted)
    assert_equal "#{award.name}", award.to_s
  end

  test 'is not valid without a name' do
    award = awards(:first_submitted)
    assert award.valid?
    award.name = nil
    refute award.valid?
  end

  test 'is not valid without a description' do
    award = awards(:first_submitted)
    assert award.valid?
    award.description = nil
    refute award.valid?
  end

  test 'is not valid without a date' do
    award = awards(:first_submitted)
    assert award.valid?
    award.date = nil
    refute award.valid?
  end

end